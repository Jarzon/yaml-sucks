#!/bin/bash
set -eu
set -o pipefail

function run {
    language="$1"
    prog="$2"
    input="$3"

    out_file="/tmp/yaml-sucks.out.json"
    err_file="/tmp/yaml-sucks.err.txt"

    $prog < $input > $out_file 2> $err_file ||:
    (   if [ -s $err_file ]; then
            echo ':x:'
            # cat $err_file >&2
            cat $err_file
        else
            echo -n "<pre><code class='$language'>"
            cat $out_file
            echo '</code></pre>'
        fi
    )
}

(   cat preamble.md
        for input in inputs/*.yaml; do
        echo '<table>'
            echo '<tr>'
                echo '<th>Source</th>'
                echo '<th>Value</th>'
            echo '</tr><tr>'
                echo '<td>YAML source</td><td>'
                    run '' cat $input
                echo '</td></tr><tr>'
                    echo '<td>yaml2json.hs</td><td>'
                    run haskell ./yaml2json.hs $input
                echo '</td></tr><tr>'
                    echo '<td>yaml2json.pl</td><td>'
                    run perl ./yaml2json.pl $input
                echo '</td></tr><tr>'
                    echo '<td>yaml2json.py</td><td>'
                    run python ./yaml2json.py $input
                echo '</td></tr><tr>'
                    echo '<td>yaml2json.rb</td><td>'
                    run ruby ./yaml2json.rb $input
                echo '</td></tr><tr>'
                    echo '<td>rq</td><td>'
                    run '' 'rq -y -J --format compact' $input
                echo '</td>'
            echo '</tr>'
            echo '</table>'
        done
) > README.md
