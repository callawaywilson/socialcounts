class MarkdownHandler < ActionView::Template::Handler
  def call(template)
  	Markdownizer.markdown(Markdownizer.coderay(template.source)).inspect
  end
end

#Register Handler
ActionView::Template.register_template_handler(:md, MarkdownHandler.new)