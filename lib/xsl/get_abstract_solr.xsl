<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" ></xsl:output>
    <!-- <xsl:preserve-space elements="no"></xsl:preserve-space> -->
    
    <xsl:variable name="newline">
        <xsl:text>&#10;</xsl:text> 
        
    </xsl:variable>
    
    <xsl:strip-space elements="*"></xsl:strip-space>
    <xsl:template match="/response">    
        
        <xsl:value-of select="//str[@name='q']"/>
        <xsl:value-of select="$newline"/>
        
        <xsl:if test="result/doc/str[@name='abstract']">
        
            <xsl:for-each select="result/doc/str[@name='abstract']">
            <xsl:value-of select="."/>            
            <xsl:value-of select="$newline"/>
        </xsl:for-each>
        </xsl:if>
        <xsl:value-of select="$newline"/><xsl:value-of select="$newline"/>
    </xsl:template>
 
</xsl:stylesheet>  
