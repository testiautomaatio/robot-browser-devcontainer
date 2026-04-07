[English version of this readme is available in the file readme.en.md](./readme.en.md)

# Ensimmäiset Robot Framework -testit 🤖

Tämän tehtävän tarkoituksena on opetella suorittamaan ja kirjoittamaan testejä [Robot Framework -työkalulla](https://robotframework.org/). 

Tehtävä on jatkoa Playwright-tehtävälle, jossa harjoiteltiin kirjautumista ja rekisteröitymistä käyttäen samaa testattavaa sivustoa. Tässä Robot Framework -tehtävässä keskitytään samoihin toiminnallisuuksiin, mutta nyt tavoitteena on toteuttaa testit Robot Framework -työkalulla.

Kuten aiemmin, tässä tehtävässä käytettävä sivusto on toteutettu testauksen harjoittelua varten, joten se ei noudata kaikkia tavanomaisia tuotantokäytössä olevien web-sivustojen oletuksia. Erityisesti sivuston kautta tehdyt rekisteröitymiset ja kirjautumiset **ovat voimassa vain saman selainistunnon sisällä**. Esimerkiksi rekisteröityminen ei siis säily eri testitapausten välillä, kun testiselain nollataan jokaisen testitapauksen alussa.

Suosittelemme alkuun pääsemiseksi katsomaan [Robot Framework tutorial (youtube.com)](https://www.youtube.com/playlist?list=PLSK6YK5OGX1AuQy0tbvdKBV9mrKi46kKH) -soittolistan videot.


## Asennukset

Robot Framework perustuu Pythoniin ja sen käyttäminen edellyttää [Pythonin sekä pip-paketinhallintajärjestelmän asennusta](https://www.python.org/downloads/).

Pythonin ja Robot Frameworkin lisäksi tarvitset [**Browser**-kirjaston](https://robotframework-browser.org/), joka mahdollistaa web-selainten ohjaamisen testeissäsi. Browser-kirjasto käyttää taustalla [**Playwright**-testaustyökalua](https://playwright.dev), joka puolestaan on toteutettu Node.js:llä, joten [tarvitset myös Node.js:n asennettuna](https://nodejs.org/en/download).

Voit tarkistaa, että sinulla on tarvittavat työkalut asennettuna, suorittamalla seuraavat komennot komentorivillä:

```sh
python3 --version  # tai `py --version` Windowsissa

node --version
pip --version
```

Pythonin käynnistyskomento voi vaihdella käyttöjärjestelmästä ja Pythonin asennustavasta riippuen. Yleensä `python3` toimii useimmissa järjestelmissä, mutta Windowsissa saatat joutua käyttämään `py`-komentoa.


### 1. Asenna Robot Framework

Robot Frameworkin kotisivulta löytyy [pika-asennusohje](https://robotframework.org/?tab=1#getting-started), jonka avulla saat sen asennettua itsellesi. Laajempi, [erillinen asennusohje](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst), esittelee tarkemmin eri vaihtoehtoja.

Pikaohjeen mukaan voit asentaa Robot Frameworkin PIP-paketinhallintajärjestelmällä:

```sh
# Install Robot Framework with pip:
pip install robotframework

# Verify the installation (prints usage instructions):
robot --help
```

👆 Komennossa käytetty pip-pakettienhallinta asentuu oletuksena Pythonin mukana. Asennettavan `robotframework`-paketin tarkemmat tiedot löytyvät pypi.org-sivustolta https://pypi.org/project/robotframework/.


### 2. Asenna tarvittavat paketit

Robot Framework sisältää perustoiminnot, joiden avulla voidaan suorittaa testejä, mutta se ei sisällä valmiita kirjastoja web-selainten ohjaamiseen. Tämän vuoksi tarvitset erillisen kirjaston, kuten [Browser-kirjaston](https://robotframework-browser.org/), joka mahdollistaa web-selainten käytön Robot Frameworkin kanssa. Browser-kirjasto käyttää taustalla [Playwright](https://playwright.dev)-työkalua, joka on Node.js:llä toteutettu työkalu web-selainten automatisointiin.

Tutustu [Browser-kirjaston ohjeisiin](https://robotframework-browser.org/#installation) ja asenna se. Pika-asennusohjeen mukaan asennus onnistuu pip-työkalulla seuraavasti:

```sh
# Install Browser library from PyPi with pip:
pip install robotframework-browser

# Verify the installation (prints usage instructions):
rfbrowser --help
```

`robotframework-browser`-paketin tarkemmat tiedot löytyvät osoitteesta https://pypi.org/project/robotframework-browser/.

Seuraavaksi tarvitset Playwright-työkalun sekä siihen kuuluvat testiselaimet. Ne asennetaan Browser-kirjaston avulla käyttäen `rfbrowser init`-komentoa:

```sh
# initialize the Browser library (installs all browsers):
rfbrowser init
```

Jos haluat käyttää vain tiettyä selainta, voit määrittää selaimen asennuskomentoon:

```sh
# alternatively, only install Chromium:
rfbrowser init chromium
```

**Playwright**-työkalua ei tarvitse erikseen asentaa Browser-kirjastoa käytettäessä, vaan se asentuu edellä mainituilla komennoilla.

Harjoituksen tai kurssin lopuksi, kun et enää tarvitse selaimia, voit vapauttaa tilaa ja poistaa testiselaimet komennolla:

```sh
# clean up browsers and node dependencies:
rfbrowser clean-node

# optionally, uninstall Robot Framework and Browser library:
pip uninstall robotframework-browser
pip uninstall robotframework
```


## Testien suorittaminen

Kun olet saanut Robot Frameworkin ja Browser-kirjaston asennettua, voit kokeilla suorittaa ensimmäisiä testejä. Tässä repositoriossa on valmiiksi määritelty testitiedosto [`tests/example.robot`](./tests/example.robot), joka sisältää yksinkertaisen testin. Voit suorittaa kyseisen testitiedoston komennolla:

```sh
robot tests/example.robot
```

Testin pitäisi mennä läpi onnistuneesti ja tulostaa testitulokset konsoliin. Lisäksi Robot Framework luo HTML-raportin, jonka voit avata selaimella. 

Raportin tarkasteleminen on erityisen hyödyllistä, mikäli testit epäonnistuvat, sillä raportti sisältää yksityiskohtaisia tietoja testitapauksista ja testien epäonnistuessä myös kuvankaappauksia.


### 3. VS Code -laajennoksen asennus

[Robot Frameworkin ohjeissa](https://docs.robotframework.org/docs/getting_started/ide) suositellaan VS Codea sekä [RobotCode](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode)-laajennosta testien kirjoittamiseksi ja suorittamiseksi VS Codessa. Suosittelemme perehtymään laajennokseen ja oman harkinnan mukaan asentamaan myös sen. Laajennos tarjoaa mm. [syntaksikorostuksen, automaattisen täydennyksen ja testien suorittamisen suoraan editorista käsin](https://robotcode.io/) ([robotcode.io](https://robotcode.io/)).



## Testattava sivusto

Testauksen kohteena toimii esimerkkisivusto https://authentication-6o1.pages.dev/, joka sisältää pienen määrän ominaisuuksia palveluun kirjautumiseksi ja käyttäjätunnusten luomiseksi. Sivusto on pyritty luomaan samalla yksinkertaiseksi, mutta myös laadukkaaksi, jotta se toimisi hyvänä ensimmäisenä testauskohteena. Laadun osalta esimerkiksi eri kenttien labelit ja virheilmoitukset on pyritty toteuttamaan niin, että niitä on helppo yksilöidä ja käsitellä ohjelmallisesti testeissä.

Sivustoa on tarkoitus testata "black box" -mallilla, eli testien kirjoittamiseksi ei ole tarkoitus perehtyä sivuston lähdekoodiin tai verkkoliikenteeseen. HTML-rakenteiden tutkiminen on kuitenkin tarpeen, jotta saat suoritettua testeissä tarvitsemasi operaatiot tekstikentille ja painikkeille.


### Rekisteröityminen

Sivustolle rekisteröityminen onnistuu osoitteessa https://authentication-6o1.pages.dev/signUp. Testisivustossa on painikkeet myös ulkoisten palveluiden hyödyntämiseen rekisteröitymisessä, mutta niihin ei ole toteutettu toiminnallisuutta.

Rekisteröityminen tällä lomakkeella luo uuden käyttäjätunnuksen, joka on voimassa vain yhden selaimen tai testitapauksen sisällä.

> [!TIP]
> Mikäli haluat hyödyntää Playwrightin edistyneempiä ominaisuuksia, voit myös tallentaa rekisteröitymisen ja kirjautumisen tilan ja uudelleenkäyttää sitä eri testeissä. Tällainen lähestymistapa on erityisen hyödyllistä laajemmissa testisarjoissa, joissa halutaan välttää kirjautumisen toistaminen jokaisessa testissä.
>
> Lue aiheesta lisää sivulta https://playwright.dev/docs/auth.


### Kirjautuminen

Kirjautuminen onnistuu osoitteessa https://authentication-6o1.pages.dev/. Kirjautumisen jälkeen käyttäjä ohjataan osoitteeseen https://authentication-6o1.pages.dev/dashboard, jossa näytetään tervetuloa-viesti. Kuten rekisteröityminen, myös kirjautuminen on voimassa vain saman istunnon sisällä.

Itse luotavien tunnusten lisäksi sivustolla on kaksi valmista tunnusta, jotka ovat aina voimassa: `alice@example.com` ja `bob@example.com`:

| Name  | Username          | Password                           | Env variables in GitHub \*         |
|-------|-------------------|------------------------------------|------------------------------------|
| Alice | alice@example.com | `}3jc\xJnQ=E=+Q_y/%Hd311bW#6{_Oyj` | `USER1_USERNAME`, `USER1_PASSWORD` |
| Bob   | bob@example.com   | `nUL9zA3q=Nt7\N,0?CL&c74U,Ic)0)dN` | `USER2_USERNAME`, `USER2_PASSWORD` |

Voit käyttää näitä tunnuksia niissä testitapauksissa, joissa tarvitset olemassa olevan käyttäjän kirjautumista tai rekisteröitymistä, tai haluat varmistaa, että samalla tunnuksella ei voi rekisteröityä uudelleen.

\* *Lue lisää ympäristömuuttujien käytöstä tämän dokumentin loppuosasta.*


## Omien testien toteuttaminen

Kun olet saanut projektin riippuvuudet asennettua ja kokeillut testauksen kohteena olevaa sivustoa, voit aloittaa omien testien kirjoittamisen. Tässä tehtävässä tavoitteena on kirjoittaa testitapaukset sivuston rekisteröitymiseen ja kirjautumiseen. Voit kirjoittaa testit joko yhteen tiedostoon tai eri tiedostoihin, riippuen siitä, miten haluat järjestää testitapauksesi. Tiedostojesi tulee noudattaa Playwrightin testitiedostojen nimeämiskäytäntöä, eli niiden tulee päättyä `.spec.ts`- tai `.spec.js`-päätteeseen.

Suorita omia testejäsi sitä mukaa, kun kirjoitat niitä, jotta voit varmistaa, että ne toimivat odotetusti. Voit suorittaa testit joko yksittäin tai kaikki kerralla riippuen siitä, miten haluat testata niitä. Voit myös käyttää Playwrightin UI-työkalua testien suorittamiseen, jos haluat seurata testien suoritusta visuaalisesti.


## Testitapaukset

Johda seuraavista vaatimuksista testitapaukset ja kirjoita niille Playwright-testit. Kussakin testitapauksessa tulee tehdä tarkoituksenmukaiset toimet (actions) ja tehdä vaadittavat tarkastukset (asserts), jotta voidaan varmistaa, että testattava toiminnallisuus toimii odotetusti. Testitapauksissa tulee huomioida myös tyypilliset virhetilanteet ja niiden käsittely.


### Kirjautuminen

* Palvelun etusivulla tulee olla kirjautumislomake, jossa on kentät sähköpostille ja salasanalle, sekä kirjautumisnappi.
* Käyttäjä tulee ohjata onnistuneen kirjautumisen jälkeen osoitteeseen `/dashboard`, jossa näytetään tervetuloa-viesti.
* Rekisteröityneen käyttäjän tulee voida kirjautua sisään sähköpostilla ja salasanalla.
* Sekä käyttäjätunnus ja salasana ovat pakollisia, ja puuttuvista tiedoista tulee näyttää virheilmoitus.
* Kirjautumisen tulee huomauttaa, mikäli käyttäjätunnus on väärässä muodossa tai salasana on liian lyhyt.
* Kirjautumisen tulee estää kirjautumiset sekä tuntemattomalla käyttäjätunnuksella että väärällä salasanalla.

Lisäksi:

* Jos käyttäjä yrittää päästä suoraan `/dashboard`-sivulle ilman voimassa olevaa kirjautumista, hänet tulee ohjata takaisin kirjautumissivulle.
* Kun kirjautunut käyttäjä kirjatuu ulos käyttäen "Logout" -painiketta, hänet tulee ohjata takaisin kirjautumissivulle.


### Rekisteröityminen

* Rekisteröitymiseen tulee päästä sekä suoraan `/signUp`-osoitteesta että etusivun "Sign up" -linkistä.
* Nimi, sähköposti ja salasana ovat rekisteröitymisessä pakollisia.
* Rekisteröitymisyritys jo rekisteröidyllä sähköpostilla näyttää virheilmoituksen.
* Rekisteröityminen oikeilla tiedoilla luo tunnuksen, näyttää onnistumisviestin ja ohjaa kirjautumissivulle.
* Rekisteröitymisessä luotua tiliä tulee voida käyttää kirjautumiseen heti rekisteröitymisen jälkeen (saman testitapauksen sisällä).


### Ohjeita ja esimerkkejä

Näiden testien kirjoittamisen myötä tavoitteena on oppia tekemään sivun sisällölle erilaisia toimenpiteitä hyödyntäen Playwrightin tarjoamia toimintoja. Lue lisää testien kirjoittamisesta [Playwrightin dokumentaatiosta (playwright.dev)](https://playwright.dev/docs/writing-tests).

Mikäli haluat tutkia esimerkkejä Playwright-testeistä, olemme lisänneet tähän repositorioon valmiiksi [demo-todo-app.spec.ts](./tests-examples/demo-todo-app.spec.ts)-tiedoston, jossa on esimerkkejä toimintojen ja tarkastusten käytöstä. Voit käyttää sitä apuna testien kirjoittamisessa ja soveltaa sen esimerkkejä omiin testitapauksiisi. Jos haluat suorittaa kyseisen tiedoston testejä, joudut siirtämään sen ensin `tests`-kansioon, jotta Playwright tunnistaa sen testitiedostoksi. Älä kuitenkaan lähetä kyseistä esimerkkitiedostoa tests-hakemistossa GitHubiin, jotta siinä olevat testit eivät sekoitu omiin ratkaisuihisi.

> [!NOTE]
> *demo-todo-app.spec.ts* on Playwrightin esimerkki, joka on lisensoitu [Apache 2.0 -lisenssillä](https://github.com/microsoft/playwright/blob/main/LICENSE). Se on lainattu tähän tehtävään opetus- ja esimerkkimateriaaliksi.


### Käyttäjätunnukset ja salasanat ympäristömuuttujissa

Käyttäjätunnusten, salasanojen ja API-avainten kirjoittaminen selkokielisinä testitapauksiin ei ole suositeltavaa, sillä ne voivat olla alttiita vahingossa julkaisemiselle. Tässä tapauksessa testijärjestelmän salasanat ovat julkisia, joten ongelma ei ole merkittävä, mutta on hyvä harjoitella myös salasanojen käsittelyä turvallisesti.

Parempi tapa käsitellä salasanoja voisi olla salaisuuksien tallentaminen ympäristömuuttujiin tai salaisuuksiksi. Playwrightin testit voivat käyttää ympäristömuuttujia, joten voit tallentaa salasanat esimerkiksi `.env`-tiedostoon ja lukea ne testitapauksissa ympäristömuuttujista. Luomasi `.env`-tiedosto puolestaan voidaan rajata versionhallinnan ulkopuolelle [.gitignore-tiedoston](./.gitignore) avulla.

Suosittelemme tutustumaan ympäristömuuttujiin ja hyödyntämään niitä tässä tehtävässä. Voit lukea lisää ympäristömuuttujista [Playwrightin dokumentaatiosta (playwright.dev)](https://playwright.dev/docs/test-parameterize#env-files). Tiedostopohjaisia ympäristömuuttujia varten tarvitset lisäksi [dotenv-paketin](https://www.npmjs.com/package/dotenv), joka tulee ottaa käyttöön [playwright.config.ts](./playwright.config.ts)-tiedoston yläosassa.

> [!NOTE]
> Jotta ympäristömuuttujat toimivat myös automaattisessa arvioinnissa, niiden täytyy olla saavatavilla myös GitHub actions -ympäristössä. GitHub ja muut CI/CD-järjestelmät tarjoavat mahdollisuuden tallentaa salaisuuksia ja ympäristömuuttujia, joten voit käyttää niitä testien suorittamiseen myös automaattisessa arvioinnissa. Jos käytät ympäristömuuttujia testeissäsi, varmista että ne on määritelty samalla nimillä ja arvoilla kuin automaattisessa arvioinnissa:
>
> * Käyttäjän Alice ympäristömuuttujat: `USER1_USERNAME`, `USER1_PASSWORD`
> * Käyttäjän Bob ympäristömuuttujat: `USER2_USERNAME`, `USER2_PASSWORD`



## Tehtävän automaattinen arviointi

Kun olet kirjoittanut testitapaukset ja varmistanut, että ne toimivat odotetusti, voit palauttaa tehtävän automaattista tarkastusta varten. Lisää luomasi testitiedostot versionhallintaan ja lähetä muutokset GitHubiin `git status`, `git add`, `git commit` ja `git push` -komennoilla. `push`-komennon jälkeen käynnistyy GitHub action -automaattitarkastus, joka suorittaa testit ja antaa niistä palautteen. Näet palautteen GitHub-repositoriosi actions-välilehdeltä.

Automaattisessa tarkastuksessa käytetään Chrome-selainta ja testit suoritetaan yksi kerrallaan headless-tilassa. Suosittelemme varmistamaan, että testit toimivat paikallisesti seuraavalla komennolla ennen palautusta:

```bash
npx playwright test --reporter="list,html" --project=chromium
```

Palautettuasi tehtävän testisi pisteytetään sen mukaan, kuinka hyvin ne todentavat edellä listattuja vaatimuksia. On siis oleellista, että testeissäsi syötät sekä oikeita että virheellisiä tietoja ja tarkistat, että sivuston tila sekä siinä näkyvät viestit toimivat oikein. Tarvittaessa tutki actions-välilehden raporttia ja testituloksia, jotta voit täydentää testejäsi kattamaan lisää testitapauksia. Voit palauttaa tehtävän uudelleen useita kertoa tehtävän määräaikaan asti.


## Riippuvuuksien ja selainten poistaminen

Mikäli haluat tehtävän päätteeksi poistaa asentamasi selaimet, Robot Frameworkin ja Browser-kirjaston, voit tehdä sen [seuraavilla komennoilla](https://github.com/MarketSquare/robotframework-browser?tab=readme-ov-file#uninstall-instructions):

```sh
# Clean old node side dependencies and browser binaries: 
rfbrowser clean-node

# Uninstall with pip:
pip uninstall robotframework-browser
pip uninstall robotframework
```


## Materiaalista

Tämän tehtävän on kehittänyt Teemu Havulinna ja se on lisensoitu [Creative Commons BY-NC-SA -lisenssillä](https://creativecommons.org/licenses/by-nc-sa/4.0/).

Tehtävän luonnissa on luotu hyödyntämällä kielimalleja ja tekoälytyökaluja, kuten GitHub Copilot ja ChatGPT.
