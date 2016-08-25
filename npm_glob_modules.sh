#!/bin/sh
NI="npm install --global"

$NI git-recent
$NI diff-so-fancy
