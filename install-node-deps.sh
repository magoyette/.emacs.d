#!/bin/sh

echo "Installing Node dependencies"
npm install -g doctoc eslint js-yaml prettier stylelint stylelint-config-standard

echo "Installing language server Node dependencies"
npm install -g vscode-css-languageserver-bin vscode-html-languageserver-bin vscode-json-languageserver yaml-language-server typescript typescript-language-server
