# action-slack-test-results
Example
```
      - name: send-slack
        uses: speareducation/action-slack-test-results@master
        with:
          status: ${{ job.status && steps.test-results.outputs.result == "OK" }} # Required
          summary: ${{ steps.test-results.output.summary }}
          coverage: ${{ steps.test-results.output.coverage }}
          slack_web_hook: ${{ secrets.SLACK_WEB_HOOK }}
```
