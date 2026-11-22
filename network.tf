/**
 * Copyright 2026 Taito United
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "upcloud_router" "router" {
  name = local.network.name
}

resource "upcloud_network" "network" {
  name = local.network.name
  zone = local.network.zone

  ip_network {
    address            = local.network.ipCidrRange
    dhcp               = true
    dhcp_default_route = true
    family             = "IPv4"
  }

  router = upcloud_router.router.id
}

resource "upcloud_gateway" "nat_gateway" {
  count = coalesce(local.network.natEnabled, false) ? 1 : 0

  name     = local.network.name
  zone     = local.network.zone
  features = ["nat"]
  router {
    id = upcloud_router.router.id
  }
}
