#!/usr/bin/env bash
if [[ -v FIJI_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$FIJI_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$FIJI_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
