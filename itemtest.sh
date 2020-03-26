#!/bin/bash
export PYTHONPATH=''
export SPEC_FILE='/opt/girder/girder/web_client/test/spec/itemSpec.js'
export ASSETSTORE_TYPE='filesystem'
export WEB_SECURITY='true'
export ENABLED_PLUGINS=''
export GIRDER_TEST_DB='mongodb://localhost:27017/girder_test_web_client_item'
export GIRDER_TEST_ASSETSTORE='web_client_item'
export GIRDER_PORT='30021'
export MONGOD_EXECUTABLE='local mongod required'
export GIRDER_TEST_DATA_PREFIX='/opt/girder-build/data'
export GIRDER_TEST_DATABASE_CONFIG=''

python -m unittest -v tests.web_client_test

