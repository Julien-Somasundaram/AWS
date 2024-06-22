#!/bin/sh

DELAY=10

sleep $DELAY


npx prisma migrate dev --name init
npm run start