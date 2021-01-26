# frozen_string_literal: true

module EpathwayScraper
  # The settings to scrape each different authority
  AUTHORITIES = {
    adelaide: {
      url: "https://epathway.adelaidecitycouncil.com/epathway/ePathwayProd",
      state: "SA",
      list: :all_this_year
    },
    ballarat: {
      url: "https://eservices.ballarat.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :advertising
    },
    barossa: {
      url: "https://epayments.barossa.sa.gov.au/ePathway/Production",
      state: "SA",
      list: :last_30_days,
      force_detail: true
    },
    bendigo: {
      url: "https://epathway.bendigo.vic.gov.au/ePathway/Production",
      state: "VIC",
      # Not using :last_30_days because the bendigo server has a problem
      list: :advertising
    },
    campbelltown: {
      url: "https://ebiz.campbelltown.nsw.gov.au/ePathway/Production",
      state: "NSW",
      list: :all
    },
    darebin: {
      url: "https://eservices.darebin.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :all_this_year
    },
    east_gippsland: {
      url: "https://epathway.egipps.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :last_30_days
    },
    frankston: {
      url: "https://epathway.frankston.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :last_30_days
    },
    gladstone: {
      url: "https://online.gladstone.qld.gov.au/ePathway/eProd",
      state: "QLD",
      list: :last_30_days
    },
    glen_eira: {
      url: "https://epathway-web.gleneira.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :all,
      max_pages: 4
    },
    gold_coast: {
      url: "https://cogc.cloud.infor.com/ePathway/epthprod",
      state: "QLD",
      list: :last_30_days
    },
    greater_shepparton: {
      url: "https://eservices.greatershepparton.com.au/ePathway/Production",
      state: "VIC",
      list: :last_30_days,
      # Has an incomplete SSL chain: See
      # https://www.ssllabs.com/ssltest/analyze.html?d=eservices.greatershepparton.com.au&latest
      disable_ssl_certificate_check: true
    },
    greatlakes: {
      url: "https://services.greatlakes.nsw.gov.au/ePathway/Production",
      state: "NSW",
      list: :all,
      max_pages: 10,
      disable_ssl_certificate_check: true
    },
    inverell: {
      url: "http://203.49.140.77/ePathway/Production",
      state: "NSW",
      list: :all_this_year
    },
    kingston: {
      url: "https://online.kingston.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :all_this_year
    },
    knox: {
      url: "https://eservices.knox.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :advertising
    },
    lake_macquarie: {
      url: "https://property.lakemac.com.au/ePathway/Production",
      state: "NSW",
      list: :last_30_days
    },
    latrobe: {
      url: "https://eservices.latrobe.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :last_30_days
    },
    livingstone: {
      url: "http://mpathway.livingstone.qld.gov.au/ePathway/Production",
      state: "QLD",
      list: :last_30_days
    },
    macedon_ranges: {
      url: "https://eservices.mrsc.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :last_30_days
    },
    maroondah: {
      url: "https://eservices.maroondah.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :advertising
    },
    monash: {
      url: "https://epathway.monash.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :advertising
    },
    mooney_valley: {
      url: "https://online.mvcc.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :advertising
    },
    moreland: {
      url: "https://eservices.moreland.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :advertising
    },
    nillumbik: {
      url: "https://epathway.nillumbik.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :advertising
    },
    onkaparinga: {
      url: "http://pathway.onkaparinga.sa.gov.au/ePathway/Production",
      state: "SA",
      list: :all_this_year
    },
    parramatta: {
      url: "https://onlineservices.parracity.nsw.gov.au/ePathway/Prod",
      state: "NSW",
      list: :all_since_2020
    },
    port_phillip: {
      url: "https://eservices.portphillip.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :last_30_days
    },
    rockhampton: {
      url: "https://eservices.rockhamptonregion.qld.gov.au/ePathway/ePathProd",
      state: "QLD",
      list: :last_30_days
    },
    salisbury: {
      url: "https://eservices.salisbury.sa.gov.au/ePathway/Production",
      state: "SA",
      list: :last_30_days
    },
    south_gippsland: {
      url: "https://eservices.southgippsland.vic.gov.au/ePathway/ePathProd",
      state: "VIC",
      list: :advertising
    },
    the_hills: {
      url: "https://epathway.thehills.nsw.gov.au/ePathway/Production",
      state: "NSW",
      list: :last_30_days
    },
    unley: {
      url: "https://online.unley.sa.gov.au/ePathway/Production",
      state: "SA",
      list: :last_30_days
    },
    west_torrens: {
      url: "https://epathway.wtcc.sa.gov.au/ePathway/Production",
      state: "SA",
      list: :last_30_days,
      # Has an incomplete SSL chain: See
      # https://www.ssllabs.com/ssltest/analyze.html?d=epathway.wtcc.sa.gov.au
      disable_ssl_certificate_check: true
    },
    whitehorse: {
      url: "https://eservices.whitehorse.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :last_30_days
    },
    wollongong: {
      url: "http://epathway.wollongong.nsw.gov.au/ePathway/Production",
      state: "NSW",
      list: :advertising
    },
    yarra_ranges: {
      url: "https://epathway.yarraranges.vic.gov.au/ePathway/Production",
      state: "VIC",
      list: :all,
      max_pages: 20
    }
  }.freeze
end
