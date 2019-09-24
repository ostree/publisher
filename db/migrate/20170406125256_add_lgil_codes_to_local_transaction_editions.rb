class AddLgilCodesToLocalTransactionEditions < Mongoid::Migration
  def self.up
    n = 0
    LGIL_CODE_VALUES.each do |slug, lgil_code_value|
      n += 1
      slug = slug.to_s
      edition = LocalTransactionEdition.where(slug: slug)
        .where(state: { '$in': %w(draft published) })
        .last
      p "no edition found for #{slug}" if edition == nil
      p n if edition.update_attribute("lgil_code", lgil_code_value)
    end
  end

  def self.down
    LocalTransactionEdition.all.each do |edition|
      edition.unset(:lgil_code)
    end
  end

  LGIL_CODE_VALUES = {
        "home-schooling-information-council" =>  8,
        "help-school-clothing-costs" =>  8,
        "help-home-school-transport" =>  8,
        "apply-free-school-meals" =>  0,
        "find-nursery-school-place" =>  8,
        "apply-for-primary-school-place" =>  0,
        "apply-for-secondary-school-place" =>  0,
        "after-school-holiday-club" =>  8,
        "childcare-out-of-school-hours" =>  8,
        "education-attendance-council" =>  8,
        "school-term-holiday-dates" =>  8,
        "apply-school-transport-for-child-with-special-educational-needs-sen" =>  0,
        "apply-for-child-performance-licence" =>  0,
        "contact-your-local-council-about-business-rates" =>  8,
        "pay-council-tax" =>  8,
        "apply-for-council-tax-discount" =>  0,
        "apply-council-tax-reduction" =>  0,
        "apply-housing-benefit-from-council" =>  8,
        "appeal-housing-benefit-decision" =>  8,
        "apply-swap-homes-council" =>  0,
        "apply-for-council-housing" =>  0,
        "report-squatters-property" => 8,
        "apply-for-sheltered-housing" =>  0,
        "homelessness-help-from-council" =>  8,
        "rent-council-garage" =>  0,
        "insurance-claim-against-council" =>  8,
        "apply-disabled-facilities-grant" =>  0,
        "repair-council-property" =>  0,
        "garden-maintenance-council-tenants" =>  8,
        "find-out-about-right-to-buy-from-your-council" =>  8,
        "apply-foster-child-council" =>  0,
        "apply-to-adopt-child-through-council" =>  0,
        "apply-home-equipment-for-disabled" =>  0,
        "apply-needs-assessment-social-services" =>  0,
        "apply-short-term-care-for-child" =>  0,
        "community-transport-services-shopmobility" =>  8,
        "apply-for-elderly-person-bus-pass" =>  0,
        "where-registered-disabled-drivers-can-park" =>  8,
        "blue-badge-scheme-information-council" =>  8,
        "apply-for-disabled-bus-pass" =>  0,
        "apply-direct-payments" =>  0,
        "day-care-centres" =>  8,
        "find-a-community-support-group-or-organisation" =>  8,
        "apply-for-community-alarm" =>  0,
        "meals-home" =>  8,
        "find-bereavement-services-from-council" =>  8,
        "complain-about-your-council" =>  8,
        "find-your-local-councillors" =>  8,
        "get-on-electoral-register" =>  8,
        "report-abandoned-vehicle" => 17,
        "report-noise-pollution-to-council" => 17,
        "asbestos-in-home" =>  8,
        "report-syringes" => 17,
        "report-pest-problem" => 17,
        "pest-control" =>  8,
        "check-council-missing-dog" =>  8,
        "report-stray-dog" => 17,
        "local-library-services" =>  8,
        "join-library" =>  8,
        "reserve-library-item" =>  0,
        "search-library-catalogue" =>  8,
        "renew-library-item" =>  8,
        "book-internet-access-at-library" =>  8,
        "find-mobile-library" =>  8,
        "search-local-archives" =>  8,
        "find-your-local-park" =>  8,
        "appeal-parking-fine" =>  8,
        "pay-parking-fine" =>  4,
        "parking-permit" =>  8,
        "apply-dropped-kerb" =>  0,
        "find-local-transport-plans" =>  8,
        "apply-work-on-protected-tree" =>  0,
        "apply-allotment" =>  0,
        "apply-work-home-conservation-area" =>  0,
        "search-register-planning-decisions" =>  8,
        "missed-bin-collection" => 17,
        "rubbish-collection-day" =>  8,
        "collection-large-waste-items" =>  0,
        "garden-waste-disposal" =>  8,
        "recycling-bin" =>  0,
        "recycling-collections" =>  8,
        "report-problem-pavement" => 17,
        "street-name-sign" => 8,
        "safe-walking-cycling-routes-school" =>  8,
        "report-obstruction-road" => 17,
        "report-road-flooding" => 17,
        "report-pothole" => 17,
        "claim-compensation-injury-road-pavement" =>  8,
        "report-problem-street-furniture" => 17,
        "roads-council-will-grit" =>  8,
        "report-problem-street-light" => 17,
        "report-problem-traffic-light" => 8,
        "request-pedestrian-crossing" =>  0,
        "request-speed-limit-change" =>  8,
        "report-dead-animal" => 17,
        "report-dog-fouling" => 17,
        "report-litter" => 17,
        "local-street-cleaning" =>  8,
        "report-graffiti" => 17,
        "report-vandalism" => 8,
        "report-flytipping" => 17,
        "report-fly-posters" => 17,
        "report-road-spillage" => 17,
        "report-dangerous-building-structure" => 17,
        "complain-demolition-works" =>  8,
        "apply-funding-community-project" =>  8,
        "chaperone-child-performers" =>  8,
        "report-blocked-drain" => 8,
        "report-derelict-abandoned-building" => 17,
        "local-planning-emergency-major-incident" =>  8,
        "support-group-for-children-young-people-families" =>  8,
        "hazardous-waste-disposal" =>  8,
        "organise-citizenship-ceremony-council" =>  8,
        "request-clinical-waste-collection" =>  0,
        "alcohol-licence-your-area" =>  8,
        "find-local-consultations" =>  8,
        "contact-council-crime-prevention-community-safety" =>  8,
        "apply-youth-opportunity-funding" =>  0,
        "subsidised-college-transport-16-19" =>  8,
        "check-school-closure" =>  8,
        "courses-qualifications" =>  8,
        "services-disrupted-severe-weather" =>  8,
        "find-registered-childminder" =>  8,
        "apply-hold-street-party" =>  0,
        "find-free-early-education" =>  8,
        "find-weighbridge" =>  8,
        "help-care-support" => 8,
      }
end
