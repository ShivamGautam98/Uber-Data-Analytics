import {
  assertResourceWasFoundInPrisma,
  assertResourceWasNotFoundInPrisma,
  confirmResourceIsProvisioned,
  queryPrismaForNamedResource,
} from '../../../../step_definitions/workflow';
import { ResourceType } from '../../../../step_definitions/resourceType';
import {
  getCompliantCloudAccountId,
  getCompliantWorkspaceName,
  getNonCompliantCloudAccountId,
  getNonCompliantWorkspaceName,
} from '../../../../step_definitions/constants';
import { Given, Then, When } from 'cucumber';

const rqlFileName = 'EnsureComposerImageVersion';

Given(
  'A Cloud Composer environment where image version is not specified or not in approved list and name containing {string} is provisioned',
  async function (name: string) {
    await confirmResourceIsProvisioned(
      this,
      name,
      ResourceType.ComposerEnvironment,
      getNonCompliantWorkspaceName(),
    );
  },
);

Given(
  'A Cloud Composer environment where image version is specified and in approved list and name containing {string} is provisioned',
  async function (name: string) {
    await confirmResourceIsProvisioned(
      this,
      name,
      ResourceType.ComposerEnvironment,
      getCompliantWorkspaceName(),
    );
  },
);

When(
  'API queries Prisma dataset for the Cloud Composer environment where image version is not specified or not in approved list called {string}',
  async function (name: string) {
    await queryPrismaForNamedResource(
      this,
      name,
      __dirname,
      rqlFileName,
      getNonCompliantCloudAccountId(),
    );
  },
);

When(
  'API queries Prisma dataset for the Cloud Composer environment where image version is specified and in approved list called {string}',
  async function (name: string) {
    await queryPrismaForNamedResource(
      this,
      name,
      __dirname,
      rqlFileName,
      getCompliantCloudAccountId(),
    );
  },
);

Then(
  'Show that the Cloud Composer environment where image version is not specified or not in approved list was found.',
  async function () {
    assertResourceWasFoundInPrisma(this);
  },
);

Then(
  'Show that the Cloud Composer environment where image version is specified and in approved list was not found.',
  async function () {
    assertResourceWasNotFoundInPrisma(this);
  },
);
