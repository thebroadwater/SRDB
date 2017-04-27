xml.instruct!

xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @people.each do |people|
    xml.url do
      xml.loc people_url(people)
      xml.lastmod people.updated_at
      xml.changefreq 'monthly'
      xml.priority '0.5'
    end
  end
end
