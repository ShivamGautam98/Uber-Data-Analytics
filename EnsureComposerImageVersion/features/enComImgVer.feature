Feature: Ensure only approved hardened image version is used for Cloud Composer environment

	Don't allow Cloud Composer environment where image version is not specified or not in the approved list

	Scenario: Prisma finds recently created Cloud Composer environment where image version is not specified or not in the approved list

		Given A Cloud Composer environment where image version is not specified or not in approved list and name containing "comnoimgver" is provisioned
		When API queries Prisma dataset for the Cloud Composer environment where image version is not specified or not in approved list called "comnoimgver"
		Then Show that the Cloud Composer environment where image version is not specified or not in approved list was found.

	Scenario: Prisma does not find recently created Cloud Composer environment where image version is specified and in approved list

		Given A Cloud Composer environment where image version is specified and in approved list and name containing "compimgver" is provisioned
		When API queries Prisma dataset for the Cloud Composer environment where image version is specified and in approved list called "compimgver"
		Then Show that the Cloud Composer environment where image version is specified and in approved list was not found.