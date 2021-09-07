if not exist "lib/src/Generated" mkdir "lib/src/Generated";
protoc --dart_out=grpc:lib/src/Generated -Iprotos protos/tourist.proto
protoc --dart_out=grpc:lib/src/Generated -Iprotos protos/register.proto