For frontend created multi-stage build by essentially just splitting old dockerfile in two parts.

For backend did same as frontend but also had to change CGO_ENABLED from default(1) to 0 when building go to create static standalone binary.

Multi-stage sizes:
frontend 93.9MB (down from 346MB)
backend 18.1MB (down from 447MB)