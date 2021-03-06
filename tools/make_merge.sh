#! /bin/bash

XLOGIN="${1}"
HW="${2}"

REPO="pb071"
GIT_HOST="gitlab.fi.muni.cz"
REPO_URL="git@$GIT_HOST:$XLOGIN/${REPO}.git"

BASE_BRANCH="hw-reviews"
HW_BRANCH="${HW}-review"

REPO_DIR="${XLOGIN}_${REPO}"

if [ -e "$REPO_DIR" ]; then
    echo "Removing repo dir ${REPO_DIR}"
    rm -rf "$REPO_DIR"
fi

echo "Cloning repository ${REPO_URL} to ${REPO_DIR}"
git clone "$REPO_URL" "$REPO_DIR"
cd $REPO_DIR

git switch -C "${HW_BRANCH}"
git reset --mixed origin/${BASE_BRANCH}
git add "${HW}"
git commit -m "${HW} Implementation"
git push -u origin "${HW_BRANCH}"

