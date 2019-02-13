# YAML sucks.

YAML specification is so ambigous,
that you can't be sure if tomorrow you will parse the same data from YAML file
as you have yesterday.

Let's see how different implementations parse YAML code.
Settings are default or near to default or typical for that language.
We use JSON to represent data the uniform way.
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>- false
- n
- off
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>[false,false,false]
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>["","n","off"]
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>[false, "n", false]
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>[false,"n",false]
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''></code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
:x:
yaml2json.hs: UnexpectedEvent {_received = Nothing, _expected = Just EventStreamStart}
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>null
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>null
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
:x:
/usr/lib/ruby/1.9.1/json/common.rb:216:in `generate': only generation of JSON objects or arrays allowed (JSON::GeneratorError)
	from /usr/lib/ruby/1.9.1/json/common.rb:216:in `generate'
	from /usr/lib/ruby/1.9.1/json/common.rb:352:in `dump'
	from ./yaml2json.rb:6:in `<main>'
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>- -.inf
- .NaN
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>["-.inf",".NaN"]
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>["-.inf",".NaN"]
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>[-Infinity, NaN]
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>[-Infinity,NaN]
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>- 1.23015e+3
- 12.3015e+02
- 1230.15
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>[1230.15,1230.15,1230.15]
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>["1.23015e+3","12.3015e+02","1230.15"]
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>[1230.15, 1230.15, 1230.15]
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>[1230.15,1230.15,1230.15]
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>0xC
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>"0xC"
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>"0xC"
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>12
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
:x:
/usr/lib/ruby/1.9.1/json/common.rb:216:in `generate': only generation of JSON objects or arrays allowed (JSON::GeneratorError)
	from /usr/lib/ruby/1.9.1/json/common.rb:216:in `generate'
	from /usr/lib/ruby/1.9.1/json/common.rb:352:in `dump'
	from ./yaml2json.rb:6:in `<main>'
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''><<
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>"\u003c\u003c"
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>"<<"
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
:x:
ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'
  in "<stdin>", line 1, column 1
</td></tr><tr>
<td>yaml2json.rb</td><td>
:x:
/usr/lib/ruby/1.9.1/json/common.rb:216:in `generate': only generation of JSON objects or arrays allowed (JSON::GeneratorError)
	from /usr/lib/ruby/1.9.1/json/common.rb:216:in `generate'
	from /usr/lib/ruby/1.9.1/json/common.rb:352:in `dump'
	from ./yaml2json.rb:6:in `<main>'
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''><<: {}
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>{}
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>{"<<":{}}
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>{}
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>{"<<":{}}
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>"<<": {}
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>{}
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>{"<<":{}}
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>{"<<": {}}
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>{"<<":{}}
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''><<: a
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>{"\u003c\u003c":"a"}
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>{"<<":"a"}
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
:x:
ConstructorError: while constructing a mapping
  in "<stdin>", line 1, column 1
expected a mapping or list of mappings for merging, but found scalar
  in "<stdin>", line 1, column 5
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>{"<<":"a"}
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>a: &alias
    k1: v1
    k2: v2

b:
    <<: *alias
    k1: override
    k3: v3

</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>{"a":{"k2":"v2","k1":"v1"},"b":{"k3":"v3","k2":"v2","k1":"override"}}
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>{"b":{"k1":"override","k3":"v3","<<":{"k1":"v1","k2":"v2"}},"a":{"k1":"v1","k2":"v2"}}
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>{"a": {"k1": "v1", "k2": "v2"}, "b": {"k1": "override", "k2": "v2", "k3": "v3"}}
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>{"a":{"k1":"v1","k2":"v2"},"b":{"k1":"override","k2":"v2","k3":"v3"}}
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>- 1000
- +1000
- 1_000
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>[1000,1000,"1_000"]
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>["1000","+1000","1_000"]
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>[1000, 1000, 1000]
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>[1000,1000,1000]
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>[8, 08, 0o10, 010]
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>[8,8,"0o10",10]
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>["8","08","0o10","010"]
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>[8, "08", "0o10", 8]
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
<pre><code class='ruby'>[8,"08",8,8]
</code></pre>
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
<table>
<tr>
<th>Source</th>
<th>Value</th>
</tr><tr>
<td>YAML source</td><td>
<pre><code class=''>"Sosa did fine.\u263A"
</code></pre>
</td></tr><tr>
<td>yaml2json.hs</td><td>
<pre><code class='haskell'>"Sosa did fine.☺"
</code></pre>
</td></tr><tr>
<td>yaml2json.pl</td><td>
<pre><code class='perl'>"Sosa did fine.☺"
</code></pre>
</td></tr><tr>
<td>yaml2json.py</td><td>
<pre><code class='python'>"Sosa did fine.\u263a"
</code></pre>
</td></tr><tr>
<td>yaml2json.rb</td><td>
:x:
/usr/lib/ruby/1.9.1/json/common.rb:216:in `generate': only generation of JSON objects or arrays allowed (JSON::GeneratorError)
	from /usr/lib/ruby/1.9.1/json/common.rb:216:in `generate'
	from /usr/lib/ruby/1.9.1/json/common.rb:352:in `dump'
	from ./yaml2json.rb:6:in `<main>'
</td></tr><tr>
<td>rq</td><td>
:x:
./run.sh: line 13: rq: command not found
</td>
</tr>
</table>
