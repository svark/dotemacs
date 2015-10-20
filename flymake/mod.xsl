<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msb="http://schemas.microsoft.com/developer/msbuild/2003"
>
 <xsl:output omit-xml-declaration="yes" indent="yes"/>
 <xsl:strip-space elements="*"/>

 <xsl:template match="node()|@*">
  <xsl:copy>
   <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
 </xsl:template>

 <xsl:template match="//msb:ClCompile/@Include">
    <xsl:attribute name="Include">
        <xsl:value-of select='concat(substring-before(.,".cpp"),"_flymake.cpp")'/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="//msb:ClCompile[@Include]">
  <xsl:copy>
   <xsl:apply-templates select="node()|@*"/>
    <xsl:element name="AdditionalOptions" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">/Zs</xsl:element>
  </xsl:copy>
 </xsl:template>
</xsl:stylesheet>
