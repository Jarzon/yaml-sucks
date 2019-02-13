#!/usr/bin/env php

<?php

$stdin = fopen('php://stdin', 'r');

echo json_encode(yaml_parse(stream_get_contents($stdin)));