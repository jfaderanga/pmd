# Quick salesforce and apex class code analyser

## Pre-requisites
1. Download and install PMD Source Code Analyzer from https://pmd.github.io/
2. If you're on windows just use git bash to run the script

## Instructions
1. Copy the pmd.sh in the root of your sfdx project
2. Execute the command for either apex class or visualforce code
```
sh pmd.sh -t apexclasses -p "./force-app/main/default/classes" -o html -r "./output.html"
```
You can also shortcut the path for apex like below.
```
sh pmd.sh -t apexclasses -p classes -o html -r "./output.html"
sh pmd.sh -t apexpages -p pages -o html -r "./output.html"
```

## Parameters
`-t` type - apexclasses or apexpages <br>
`-p` path of files to analyze, can be a full path or shortcut for sfdx classes/pages <br>
`-o` the output file format, mostly html, check the pmd docs for more format information <br>
`-r` the output directory, default to pmdoutput.html if output and directory is not provided <br>
