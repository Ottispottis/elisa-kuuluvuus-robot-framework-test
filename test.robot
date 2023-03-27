*** Settings ***

Library    SeleniumLibrary
Library    Collections

*** Variables ***

${URL}    https://elisa.fi/kuuluvuus/
${BROWSER}    Chrome
${SEARCH_BOX}    id:search-input
# Change this to test with different locations.
${ADDRESS}    Ratavartijankatu 5, Helsinki
${INFO_WINDOW}    id:infoWindow
${COVERAGE_CLASS}    class:elisa__coverage-map__info-box__technology
${FILLED_STAR}    class:ea-icon.ea-icon--star-filled.staricon_blue
${GREY_STAR}    class:ea-icon.ea-icon--star.ea-icon--star-filled.staricon_grey
${TABLE_XPATH}      xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[4]/div/div/div/div[1]/div/div/div/div/ul/li/table
${rating}    ${EMPTY}      

*** Test Cases ***

Test coverage page
    Open Browser   ${URL}    ${BROWSER}
    Input Text   ${SEARCH_BOX}    ${ADDRESS}
    Press Keys      None   ENTER
    #Wait for table element that contains coverage ratings to load in.
    Wait Until Page Contains Element    ${TABLE_XPATH}    timeout=30s
    
    @{coverages}=    Get WebElements    ${COVERAGE_CLASS}
    ${rows}=    Get Length    ${coverages}
    ${ratings_filled}=    Get Element Count    ${FILLED_STAR}
    ${ratings_grey}=    Get Element Count    ${GREY_STAR}
    ${total}=    Evaluate    ${ratings_grey} + ${ratings_filled}
    #Divided total used because total can vary depending on available signal types
    ${divided_total}=    Evaluate    $total/${rows}
    
    #Should always be equal to 3 if coverage ratings have loaded properly
    IF    ${divided_total} < 3
        Fail    msg=Missing star rating
        
    END
    
    FOR    ${row}    IN RANGE    1    ${rows + 1}
        ${rating}=    Set Variable    0
        FOR    ${cell}    IN RANGE    2    5
            ${cell_class}=    Get Element Attribute    xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[4]/div/div/div/div[1]/div/div/div/div/ul/li/table/tbody/tr[${row}]/td[${cell}]    class
            
            IF    '${cell_class}' == 'ea-icon ea-icon--star-filled staricon_blue'
                ${rating}=    Evaluate    ${rating} + 1     
            END
        END

        ${signal_type}=    Get From List    ${coverages}    ${row-1}
        ${signal_type_text}=    Get Text    ${signal_type}
        Log    ${signal_type_text} signal strength at ${ADDRESS}: ${rating}/3
    END
    
    