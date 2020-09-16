require "gds_api/publishing_api_v2"
require "gds_api/calendars"
require "gds_api/link_checker_api"
require "gds_api/imminence"

module Services
  def self.publishing_api
    client = Aws::ServiceDiscovery::Client.new(
      region: "eu-west-1",
    )

    resp = client.discover_instances({
      health_status: "ALL",
      max_results: 10,
      namespace_name: "govuk-publishing-platform",
      service_name: "publishing-api",
    })

    instance = resp.instances.sample.attributes

    GdsApi::PublishingApi.new(
      "http://#{instance.dig("AWS_INSTANCE_IPV4")}:#{instance.dig("AWS_INSTANCE_PORT")}",
      bearer_token: ENV["PUBLISHING_API_BEARER_TOKEN"] || "example",
    )
  end

  def self.link_checker_api
    @link_checker_api ||= GdsApi::LinkCheckerApi.new(
      Plek.new.find("link-checker-api"),
      bearer_token: ENV["LINK_CHECKER_API_BEARER_TOKEN"],
    )
  end

  def self.imminence
    @imminence ||= GdsApi::Imminence.new(
      Plek.new.find("imminence"),
    )
  end
end
