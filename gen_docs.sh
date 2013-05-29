#!/bin/sh
SRC_DIR="RGToast"
OUT_DIR="docs"
PROJECT_VERSION="1.0.0"
PROJECT_NAME="RGToast-${PROJECT_VERSION}"
COMPANY_ID="com.ryangrier.rgtoast"
COMPANY_NAME="Ryan Grier"

echo "Generating ${PROJECT_NAME} appledocs"

/usr/local/bin/appledoc -o ${OUT_DIR} -p ${PROJECT_NAME} -c "${COMPANY_NAME}" -v ${PROJECT_VERSION} --company-id ${COMPANY_ID} --keep-undocumented-objects ${SRC_DIR} 

echo "Finished generating ${PROJECT_NAME} appledocs"