import { Stack, StackProps } from "aws-cdk-lib";
import { Construct } from 'constructs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import { FunctionUrlAuthType, HttpMethod } from "aws-cdk-lib/aws-lambda";

export class HieroRubyStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

    const url = new lambda.Function(this, 'MyFunction', {
      runtime: lambda.Runtime.RUBY_2_7,
      handler: 'main.lambda_handler',
      code: lambda.Code.fromAsset('./app'),
    });

    url.addFunctionUrl({
      authType: lambda.FunctionUrlAuthType.NONE,
    });
  }
}
