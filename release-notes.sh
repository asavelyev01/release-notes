git fetch --tags
DEFAULT_BRANCH=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "Last tag $LAST_TAG"
(git --no-pager log "$LAST_TAG...origin/$DEFAULT_BRANCH" --pretty='format:- %s %C(auto)%h' && echo "\n" )| tac
