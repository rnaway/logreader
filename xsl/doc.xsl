<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml">

    <xsl:template name="lineBreak">
        <xsl:param name="input"/>
        <xsl:choose>
            <xsl:when test="contains($input, '&#10;')">
                <xsl:value-of select="substring-before($input, '&#10;')"/><w:br/>
                <xsl:call-template name="lineBreak">
                    <xsl:with-param name="input" select="substring-after($input, '&#10;')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$input"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/">
        <w:wordDocument
       xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml"
       xmlns:v="urn:schemas-microsoft-com:vml"
       xmlns:o="urn:schemas-microsoft-com:office:office"
       xml:space="preserve">
  <w:body>
      <w:p>
          <w:pPr>
             <w:jc w:val="center"/>
          </w:pPr>
          <w:r>
              <w:rPr>
                  <w:b w:val="on"/>
                  <w:sz w:val="36"/>
                  <w:sz-cs w:val="36"/>
              </w:rPr>
              <w:t>logreader 1.0.1</w:t>
          </w:r>
      </w:p>
      <w:p>
          <w:pPr>
             <w:jc w:val="center"/>
          </w:pPr>
        <w:r>
          <w:pict>
              <v:shape id="_x0000_i1025" type="_x0000_t75" style="width:220pt;height:146pt">
                  <v:imagedata src="C:\Users\alexander\IdeaProjects\logreader\xsl\siblion_logo.gif" o:title="FolderN"/>
              </v:shape>
          </w:pict>
        </w:r>
      </w:p>
      <w:p>
          <w:pPr>
              <w:jc w:val="center"/>
          </w:pPr>
          <w:r>
              <w:rPr>
                  <w:b w:val="on"/>
                  <w:sz w:val="28"/>
                  <w:sz-cs w:val="28"/>
              </w:rPr>
              <w:t>Siblion company</w:t>
              <w:br w:type="text-wrapping"/>
          </w:r>
          <w:r>
              <w:t>Created by Alexander Nesterov</w:t>
          </w:r>
      </w:p>
      <w:br w:type="text-wrapping"/>
  	<xsl:for-each select="/logMessages/logMessage">
	<w:p>
      <w:r>
          <w:rPr>
              <w:b w:val="on"/>
              <w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:cs="Courier New"/>
          </w:rPr>
        <w:t><xsl:value-of select="date"/></w:t>
      </w:r>
    </w:p>
		<w:p>
      <w:r>
          <w:rPr>
              <w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:cs="Courier New"/>
          </w:rPr>
        <w:t xml:space="preserve">
            <xsl:call-template name="lineBreak">
	        <xsl:with-param name="input" select="message"/>
	        </xsl:call-template>
        </w:t>
      </w:r>
    </w:p>
		<w:p>
    </w:p>
	</xsl:for-each>
  </w:body>
</w:wordDocument>
</xsl:template>
</xsl:stylesheet>