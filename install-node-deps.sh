#!/bin/sh

echo "Installing Node dependencies"
npm install -g doctoc eslint js-yaml prettier stylelint stylelint-config-standard

echo "Installing language server Node dependencies"
npm install -g vscode-langservers-extracted bash-language-server typescript typescript-language-server yaml-language-server
