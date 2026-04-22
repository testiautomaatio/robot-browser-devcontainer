# Development container for Robot Framework and Browser library

Robot Framework is a Python-based test automation framework, so using it requires Python and pip to be installed. The Browser library, commonly used for web testing with Robot Framework, utilizes the Node.js based Playwright library, so Node.js must also be installed to use the Browser library. Playwright also uses browser engines that need installation. Although the setup process is often straightforward, it can be time-consuming and may involve troubleshooting, especially for those new to test automation or web testing.

This repository provides a [development container](https://code.visualstudio.com/docs/remote/containers) that includes all the necessary tools and dependencies for using Robot Framework and the Browser library. The container is configured to work with Visual Studio Code's Remote Containers extension, allowing you to develop and run tests in a consistent environment without worrying about local setup issues. This container works both in local development using Docker and in [GitHub Codespaces](https://github.com/features/codespaces), which provides a cloud-based development environment.

To use the development container locally, you need to have [Docker](https://www.docker.com/get-started) installed on your machine and the [Visual Studio Code Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension installed. You can also open the development container in GitHub Codespaces by following [this guide](https://docs.github.com/en/codespaces/developing-in-a-codespace/creating-a-codespace-for-a-repository#creating-a-codespace).


## Tools included in the container

* [Python](https://www.python.org/)
* [Node.js](https://nodejs.org/)
* [Robot Framework](https://robotframework.org/)
* [Robot Framework Browser library](https://robotframework-browser.org/)
* [Playwright browsers (Chromium)](https://playwright.dev/docs/browsers/)
* [RobotCode extension for VS Code](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode)
* [Robocop static code analysis and formatting tool](https://github.com/MarketSquare/robotframework-robocop)

Python, Node.js and Robocode are installed with the [devcontainer.json](./.devcontainer/devcontainer.json) configuration, and the rest of the tools are installed with the [`postCreate.sh` script](./.devcontainer/postCreate.sh) that runs after the container is created.


## Verifying the setup

There is one test case in the `tests/example.robot` file that verifies the setup:

```sh
robot --outputdir=test-results/ tests/example.robot
```

The test should pass successfully and print the results to the console. Robot Framework also generates an HTML report that you can open in a browser.


## Licenses

Robot Framework is licensed under the [Apache 2.0 license](https://github.com/robotframework/robotframework/blob/master/LICENSE.txt).

The Browser library is licensed under the [Apache 2.0 license](https://github.com/MarketSquare/robotframework-browser/blob/main/LICENSE).

The RobotCode extension is licensed under the [Apache 2.0 license](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode#license).

The Robocop tool is licensed under the [Apache 2.0 license](https://github.com/MarketSquare/robotframework-robocop/blob/main/LICENSE).


## About the material

This repository was created by Teemu Havulinna and is licensed under [Creative Commons BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/).

Language models and AI tools such as GitHub Copilot and ChatGPT were used in creating this repository.
