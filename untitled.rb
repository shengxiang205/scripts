view = View.find(18);view_config = ViewConfigLoader::RailsLoader::ViewConfig.new(view)
view_config.view_component_items.map {|c| c.params}
output = Rails.root.join("tmp", "index.html").to_s

File.open(output, "w") do |stream|
    #Render::Base.get_render("html").new(view_config).render!(stream)
    ORM.orm_business(stream, view_config.marketing_config, "business")
end

ORM::Mapper::Base.as_mapper(view_config.marketing_config, "business")
ORM::Mapper::Base.mapper_config
view_config.marketing_config.explain_api("表款.名称")

view_config.marketing_config.explain_api("表款.手表系列.手表")

view_config.marketing_config.send(:category_named, "watch").category_attributes["手表系列"].category.category_attributes.values.last.label


View.all.each { |v| log_info("view: #{v.id}");ViewTemplateBuilder.new(v, Rails.root.join("tmp", "test").to_s, {:test =>true}).build! unless [12,14,15].include?(v.id) }

view = View.find(12);view_config = ViewConfigLoader::RailsLoader::ViewConfig.new(view)

ViewTemplateBuilder.test

ViewTemplateBuilder.new(View.find(31), Rails.root.join("public", "test").to_s, {:test =>true}).build!