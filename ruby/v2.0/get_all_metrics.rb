#!/usr/bin/env ruby
# Encoding: utf-8
#
# Author:: api.Dean.Lukies@gmail.com (Dean Lukies)
#
# Copyright:: Copyright 2014, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# Gets all metrics available for the logged in user's account.
#
# Tags: metadata.metrics.list

require 'adexchangeseller_common'

# The maximum number of results to be returned in a page.
MAX_PAGE_SIZE = 50

def get_all_metrics(adexchangeseller)
  result = adexchangeseller.accounts.metadata.metrics.list(
    :accountId => ACCOUNT_ID,
    :maxResults => MAX_PAGE_SIZE).execute

  result.data.items.each do |metric|
    puts 'Metric id "%s" for product(s): [%s] was found.' %
      [metric.id, metric.supportedProducts.join(', ')]
  end
end


if __FILE__ == $0
  adexchangeseller = service_setup()
  get_all_metrics(adexchangeseller)
end
