*** Comments ***
This example has been borrowed from https://github.com/MarketSquare/robotframework-browser.
The Browser library is licensed under the Apache-2.0 license.


*** Settings ***
Library             Browser


*** Test Cases ***
Example Test
    New Page    https://playwright.dev
    Get Text    h1    contains    Playwright
