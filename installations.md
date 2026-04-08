# Robot Frameworkin ja Browser-kirjaston asennus

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

Harjoituksen tai kurssin lopuksi, kun et enää tarvitse selaimia, voit vapauttaa tilaa ja poistaa työkalut sekä testiselaimet komennolla:

```sh
# clean up browsers and node dependencies:
rfbrowser clean-node

# optionally, uninstall Robot Framework and Browser library:
pip uninstall robotframework-browser
pip uninstall robotframework
```


### 3. VS Code -laajennoksen asennus

[Robot Frameworkin ohjeissa](https://docs.robotframework.org/docs/getting_started/ide) suositellaan VS Codea sekä [RobotCode](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode)-laajennosta testien kirjoittamiseksi ja suorittamiseksi VS Codessa. Suosittelemme perehtymään laajennokseen ja oman harkinnan mukaan asentamaan myös sen. Laajennos tarjoaa mm. [syntaksikorostuksen, automaattisen täydennyksen ja testien suorittamisen suoraan editorista käsin](https://robotcode.io/) ([robotcode.io](https://robotcode.io/)).
