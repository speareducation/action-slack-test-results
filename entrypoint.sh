#!/usr/bin/env bash

if [ "$INPUT_STATUS" == "true" ]
then
    AUTHOR_ICON="https://a.slack-edge.com/production-standard-emoji-assets/10.2/apple-large/2705@2x.png"
    COLOR="#7cc142" # green
else
    AUTHOR_ICON="https://a.slack-edge.com/production-standard-emoji-assets/10.2/apple-large/274c@2x.png"
    COLOR="#cc0000" # red
fi

SLACK_MESSAGE=$(cat << EOF
{
    "attachments": [
        {
            "color": "${COLOR}",
            "author_name": "${INPUT_PROJECT_NAME} CI Results",
            "author_link": "${INPUT_REPOSITORY_LINK}",
            "author_icon": "${AUTHOR_ICON}"
        },
        {
            "color": "${COLOR}",
            "fields": [
                {
                    "title": "Summary",
                    "value": "${INPUT_SUMMARY}",
                    "short": true
                },
                {
                    "title": "Coverage",
                    "value": "${INPUT_COVERAGE}",
                    "short": true
                },
            ]
        }
    ]
}
EOF
)

curl -v -sS -D /dev/stdout -H 'Content-Type: application/json' -d "$SLACK_MESSAGE" $INPUT_SLACK_WEB_HOOK
exit $?
