#
# Copyright:: Copyright 2017, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "spec_helper"

describe Chef::Resource::Reboot do

  let(:resource) { Chef::Resource::Reboot.new("reboot me!") }

  it "sets the default action as :nothing" do
    expect(resource.action).to eql([:nothing])
  end

  it "supports :cancel, :reboot_now, :request_reboot actions" do
    expect { resource.action :cancel }.not_to raise_error
    expect { resource.action :reboot_now }.not_to raise_error
    expect { resource.action :request_reboot }.not_to raise_error
  end

  it "has a resource_name of :reboot" do
    expect(resource.resource_name).to eq(:reboot)
  end

  it "accepts a String for the reboot reason" do
    resource.reason "reasons"
    expect(resource.reason).to eq("reasons")
  end

  it "accepts an Integer for delay_mins" do
    resource.delay_mins 100
    expect { resource.delay_mins "100" }.to raise_error(ArgumentError)
  end
end
