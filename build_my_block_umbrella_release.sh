#!/bin/sh

BUCKET_NAME="my-block-cerebrum"
RELEASE_NAME=my-block-umbrella-release-latest

# mix clean --deps
mix deps.get --only prod
MIX_ENV=prod mix compile

cd apps/my_block_web/assets/ && yarn install --production && brunch build --production && cd ../../../
cd apps/my_block_admin_web/assets/ && yarn install --production && brunch build --production && cd ../../../
MIX_ENV=prod mix phoenix.digest

docker run --rm -it -v $(pwd):/app my-block-umbrella-builder

gsutil cp _build/prod/rel/my_block_umbrella/bin/my_block_umbrella.run \
    gs://${BUCKET_NAME}/${RELEASE_NAME}
    