xml.instruct!

xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc root_url
    xml.changefreq 'weekly'
    xml.priority 1.0
  end

  xml.url do
    xml.loc root_url + 'people'
    xml.changefreq 'daily'
    xml.priority 1.0
  end

  xml.url do
    xml.loc root_url + 'groups'
    xml.changefreq 'daily'
    xml.priority 1.0
  end

  xml.url do
    xml.loc root_url + 'locations'
    xml.changefreq 'daily'
    xml.priority 1.0
  end

  xml.url do
    xml.loc root_url + 'events'
    xml.changefreq 'daily'
    xml.priority 1.0
  end

  xml.url do
    xml.loc root_url + 'occurrences'
    xml.changefreq 'daily'
    xml.priority 1.0
  end

  xml.url do
    xml.loc root_url + 'sources'
    xml.changefreq 'monthly'
    xml.priority 1.0
  end

  @people.each do |person|
    xml.url do
      xml.loc person_url(person)
      xml.lastmod person.updated_at
      xml.changefreq 'monthly'
      xml.priority '0.5'
    end
  end

  @groups.each do |group|
    xml.url do
      xml.loc group_url(group)
      xml.lastmod group.updated_at
      xml.changefreq 'monthly'
      xml.priority '0.5'
    end
  end

  @locations.each do |location|
    xml.url do
      xml.loc location_url(location)
      xml.lastmod location.updated_at
      xml.changefreq 'monthly'
      xml.priority '0.5'
    end
  end

  @events.each do |event|
    xml.url do
      xml.loc event_url(event)
      xml.lastmod event.updated_at
      xml.changefreq 'monthly'
      xml.priority '0.5'
    end
  end

  @occurrences.each do |occurrence|
    xml.url do
      xml.loc occurrence_url(occurrence)
      xml.lastmod occurrence.updated_at
      xml.changefreq 'monthly'
      xml.priority '0.5'
    end
  end

  @sources.each do |source|
    xml.url do
      xml.loc source_url(source)
      xml.lastmod source.updated_at
      xml.changefreq 'monthly'
      xml.priority '0.5'
    end
  end

end
