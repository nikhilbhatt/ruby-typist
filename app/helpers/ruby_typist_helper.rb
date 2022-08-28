module RubyTypistHelper
  def typer(typer_content)
    return unless valid_typer_content?(typer_content)

    answer = "["
    typer_content.each_with_index do |value, index|
      answer += index != typer_content.count - 1 ? "\"#{value}\"," : "\"#{value}\""
    end
    answer += "]"

    html_content = "<span id='ruby-typist' data-period='2000' data-typer='#{answer}'>#{typer_content[0]}</span>"
    insert_js html_content
  end

  private

  def insert_js(content)
    span_tag = %r{</span>}
    js_script = %(<script> #{File.read(File.join(File.dirname(__FILE__), '../javascripts/typist.js'))} </script>)
    content.gsub(span_tag, "#{js_script} \\0")
  end

  def valid_typer_content?(typer_content)
    typer_content.is_a?(Array) && typer_content.size.positive?
  end
end
