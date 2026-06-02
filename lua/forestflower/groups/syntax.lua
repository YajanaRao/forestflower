---Syntax highlighting groups (core syntax + treesitter + LSP semantic).

local highlights = require("forestflower.core.highlights")

---@param p table palette
---@param config ForestflowerConfig
---@return Highlights
return function(p, config)
  local create = highlights.create
  local link = highlights.link
  local styles = highlights.styles

  local optional_italics = config.italics and { styles.italic } or {}

  return {
    -- Basic syntax
    Comment = create(p.syntax_comment, p.none, optional_italics),
    SpecialComment = link("Comment"),

    -- Keywords
    Keyword = create(p.syntax_keyword, p.none, optional_italics),
    Conditional = link("Keyword"),
    Repeat = link("Keyword"),
    Label = create(p.syntax_type, p.none),
    Exception = link("Keyword"),
    Statement = link("Keyword"),
    PreProc = link("Keyword"),
    PreCondit = link("Keyword"),
    Include = link("Keyword"),
    Define = link("Keyword"),
    Macro = create(p.syntax_keyword, p.none, optional_italics),

    -- Types
    Type = create(p.syntax_type, p.none),
    Typedef = link("Type"),
    StorageClass = link("Type"),
    Structure = link("Type"),

    -- Functions
    Function = create(p.syntax_function, p.none),
    Method = link("Function"),

    -- Variables
    Identifier = create(p.ink, p.none),
    Variable = create(p.syntax_variable, p.none),
    Constant = create(p.syntax_number, p.none),

    -- Strings and numbers
    String = create(p.syntax_string, p.none),
    Character = link("String"),
    Number = create(p.syntax_number, p.none),
    Float = link("Number"),
    Boolean = create(p.syntax_number, p.none),

    -- Operators
    Operator = create(p.syntax_operator, p.none),
    Special = create(p.syntax_regex, p.none),
    SpecialChar = link("Special"),

    -- Tags
    Tag = link("Type"),

    -- Delimiters
    Delimiter = create(p.syntax_punctuation, p.none),

    -- Underlined
    Underlined = create(p.none, p.none, { styles.underline }),

    -- Error / Todo
    Error = create(p.syntax_tag, p.none),
    Todo = create(p.syntax_keyword, p.none, { styles.bold }),

    Ignore = link("Comment"),

    -- Treesitter
    ["@keyword"] = link("Keyword"),
    ["@keyword.function"] = link("Keyword"),
    ["@keyword.return"] = link("Keyword"),
    ["@keyword.operator"] = link("Keyword"),
    ["@conditional"] = link("Conditional"),
    ["@repeat"] = link("Repeat"),
    ["@label"] = link("Label"),
    ["@exception"] = link("Exception"),

    ["@function"] = link("Function"),
    ["@function.builtin"] = link("Function"),
    ["@function.call"] = link("Function"),
    ["@method"] = link("Function"),
    ["@method.call"] = link("Function"),
    ["@constructor"] = link("Function"),

    ["@type"] = link("Type"),
    ["@type.builtin"] = link("Type"),
    ["@type.definition"] = link("Type"),
    ["@type.qualifier"] = link("Keyword"),

    ["@variable"] = link("Variable"),
    ["@variable.builtin"] = link("Variable"),
    ["@variable.parameter"] = create(p.syntax_variable, p.none),
    ["@variable.member"] = create(p.syntax_variable, p.none),
    ["@property"] = create(p.syntax_variable, p.none),
    ["@field"] = create(p.syntax_variable, p.none),
    ["@constant"] = link("Constant"),
    ["@constant.builtin"] = link("Constant"),

    ["@string"] = link("String"),
    ["@string.escape"] = create(p.syntax_regex, p.none),
    ["@string.regexp"] = create(p.syntax_regex, p.none),
    ["@character"] = link("Character"),
    ["@number"] = link("Number"),
    ["@float"] = link("Float"),
    ["@boolean"] = link("Boolean"),

    ["@operator"] = link("Operator"),
    ["@punctuation.delimiter"] = link("Delimiter"),
    ["@punctuation.bracket"] = link("Delimiter"),
    ["@punctuation.special"] = link("Special"),

    ["@comment"] = link("Comment"),
    ["@comment.documentation"] = link("SpecialComment"),
    ["@comment.error"] = create(p.error, p.none),
    ["@comment.warning"] = create(p.warning, p.none),
    ["@comment.todo"] = link("Todo"),
    ["@comment.note"] = create(p.info, p.none),

    -- Tags (HTML/JSX)
    ["@tag.builtin"] = link("Tag"), -- HTML tags route to Type (blue)
    ["@tag"] = create(p.syntax_tag, p.none), -- React/PascalCase components
    -- DESIGN: gold is chrome-only. JSX attributes route to syntax_keyword.
    ["@tag.attribute"] = create(p.syntax_keyword, p.none),
    ["@tag.delimiter"] = create(p.syntax_punctuation, p.none),

    -- Markup
    ["@markup.heading"] = create(p.syntax_type, p.none, { styles.bold }),
    ["@markup.strong"] = create(p.none, p.none, { styles.bold }),
    ["@markup.italic"] = create(p.none, p.none, { styles.italic }),
    ["@markup.strikethrough"] = create(p.none, p.none, { styles.strikethrough }),
    ["@markup.underline"] = create(p.none, p.none, { styles.underline }),
    ["@markup.link"] = create(p.syntax_regex, p.none, { styles.underline }),
    ["@markup.link.url"] = create(p.syntax_string, p.none),
    ["@markup.raw"] = create(p.syntax_string, p.none),
    ["@markup.list"] = link("Special"),

    -- Misc
    ["@namespace"] = create(p.syntax_tag, p.none),
    ["@macro"] = link("Macro"),
    ["@preproc"] = link("PreProc"),
    ["@include"] = link("Include"),
    ["@define"] = link("Define"),

    -- LSP Semantic Tokens
    ["@lsp.type.class"] = link("Type"),
    ["@lsp.type.decorator"] = link("Function"),
    ["@lsp.type.enum"] = link("Type"),
    ["@lsp.type.enumMember"] = link("Constant"),
    ["@lsp.type.function"] = link("Function"),
    ["@lsp.type.interface"] = link("Type"),
    ["@lsp.type.macro"] = link("Macro"),
    ["@lsp.type.method"] = link("Function"),
    ["@lsp.type.namespace"] = create(p.syntax_tag, p.none),
    ["@lsp.type.parameter"] = create(p.syntax_variable, p.none),
    ["@lsp.type.property"] = create(p.syntax_variable, p.none),
    ["@lsp.type.struct"] = link("Type"),
    ["@lsp.type.type"] = link("Type"),
    ["@lsp.type.typeParameter"] = link("Type"),
    ["@lsp.type.variable"] = link("Variable"),

    -- React/JSX/TSX
    ["@constructor.tsx"] = create(p.syntax_tag, p.none),
    ["@constructor.jsx"] = create(p.syntax_tag, p.none),
    ["@variable.builtin.tsx"] = create(p.syntax_keyword, p.none),
    ["@variable.builtin.jsx"] = create(p.syntax_keyword, p.none),
    ["@function.call.tsx"] = link("Function"),
    ["@function.call.jsx"] = link("Function"),
    ["@type.tsx"] = link("Type"),
    ["@type.builtin.tsx"] = link("Type"),
    ["@keyword.tsx"] = link("Keyword"),
    ["@keyword.jsx"] = link("Keyword"),
  }
end
