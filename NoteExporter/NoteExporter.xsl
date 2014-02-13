<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oo="http://www.omnigroup.com/namespace/OmniOutliner/v3"
    exclude-result-prefixes="oo"
    >
    
    <xsl:output method='text' encoding='utf-8'/>
    <xsl:strip-space elements="*" />
    
    <xsl:template match="/">
        <xsl:apply-templates select="oo:outline/oo:root"/>
	</xsl:template>

    <xsl:template match="oo:outline/oo:root">
        <xsl:apply-templates select="oo:item"/>
	</xsl:template>

    <xsl:template match="oo:item">
        <xsl:apply-templates select="oo:note/oo:text/oo:p"/>
        <xsl:apply-templates select="oo:children"/>
        <xsl:variable name="val" select="normalize-space(oo:note)"/>
		<xsl:if test="$val != ''">
<xsl:text>
</xsl:text>
		</xsl:if>
	</xsl:template>


    <xsl:template match="oo:children">
        <xsl:apply-templates select="oo:item"/>
    </xsl:template>

    <xsl:template match="oo:run/oo:style">
    </xsl:template>

    <xsl:template match="oo:run/oo:lit">
        <xsl:apply-templates select="oo:cell"/>
		<xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="oo:cell">
        <xsl:value-of select="@name"/>
    </xsl:template>

    <xsl:template match="oo:note/oo:text/oo:p">
        <xsl:apply-templates select="oo:run/oo:style"/>
        <xsl:apply-templates select="oo:run/oo:lit"/>
<xsl:text>
</xsl:text>
	</xsl:template>

</xsl:stylesheet>