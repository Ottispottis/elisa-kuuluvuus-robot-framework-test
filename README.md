<h1> Testiautomaatio Elisan <a href="https://elisa.fi/kuuluvuus/">kuuluvuussivun</a> toiminnallisuuden testaamiseksi</h1>

<h2>Toiminnallisuus</h2>
<p>Hakee <a href="https://github.com/Ottispottis/elisa-kuuluvuus-robot-framework-test/blob/668e1a37421d6919420f920629f06a793563e902/test.robot#L11">${ADDRESS}</a> muuttujan mukaisen osoitteen kuuluvuussivulta ja varmistaa, että signaalien tähtiluokitukset tulevat sivulle halutulla tavalla.</p>
<p><a href="https://github.com/Ottispottis/elisa-kuuluvuus-robot-framework-test/blob/main/log.html">log.html</a> tiedoston lopussa näkyvät signaalityypit ja niiden tähtiluokitukset.</p>
<p>Testi epäonnistuu jos kaikki tähtiluokitukset eivät lataudu sivulle, tai jos taulukko johon luokitusten tulisi ilmestyä ei lataudu 30 sekunissa.</p>

<h2>Esivaatimukset automaation käyttöön</h2>
<li>Python 3.7+</li>
<li>Robot Framework -kirjasto</li>
<li>Selenium Robot Framework -kirjasto</li>
<li>IDE/Text editor, jossa tuki Robot Frameworkille (esim: VS Code tai PyCharm)</li>


