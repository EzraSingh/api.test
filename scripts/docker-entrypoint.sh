
#!/bin/sh

ACTION="$1"

case $ACTION in
    run-dev)
		npm run start:dev
		;;
	run-staging)
		npm run start:prod
		break
		;;
	run-prod)
		pm2-runtime dist/main.ts
		break
		;;
	*)
		echo "No entrypoint action was taken"
		;;
esac