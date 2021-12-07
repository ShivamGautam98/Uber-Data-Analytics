Feature: Ensure GKE endpoint is Not Publicly accessible for Cloud Composer

	Don't allow Cloud Composer without Private IP enabled for GKE

	Scenario: Prisma finds recently created Cloud Composer with Private IP for GKE disabled

		Given A Cloud Composer with Private IP disabled for GKE and name containing "clcomprvipdis" is provisioned
		When API queries Prisma dataset for the Cloud Composer with Private IP disabled for GKE called "clcomprvipdis"
		Then Show that the Cloud Composer with Private IP disabled for GKE was found.

	Scenario: Prisma does not find recently created Cloud Composer with Private IP enabled for GKE

		Given A Cloud Composer with Private IP enabled for GKE and name containing "clcomprvipen" is provisioned
		When API queries Prisma dataset for the Cloud Composer with Private IP enabled for GKE called "clcomprvipen"
		Then Show that the Cloud Composer with Private IP enabled for GKE was not found.