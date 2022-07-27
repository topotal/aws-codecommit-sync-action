# aws-codecommit-sync-action

Sync GitHub Repository to AWS CodeCommit using with AWS credentials.

## Inputs

- `codecommit_url`: Backup target CodeCommit Repository (Must be use `https`)

## Example

```
name: aws-codecommit-sync

on:
  push:
    branches:
      - master

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          role-to-assume: arn:aws:iam::111111111111:role/my-github-actions-role-test
          aws-region: us-east-1

      - name: Sync GitHub Repository to AWS CodeCommit
        uses: topotal/aws-codecommit-sync-action@v1
        with:
          codecommit_url: https://git-codecommit.us-east-1.amazonaws.com/v1/repos/example-repository
```

## License

MIT
