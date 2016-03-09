<!-- Tufts VUE 3.2.2 concept-map (Precision_Recall_Query_Workflow_Diagram.vue) 2016-03-08 -->
<!-- Tufts VUE: http://vue.tufts.edu/ -->
<!-- Do Not Remove: VUE mapping @version(1.1) jar:file:/C:/Program%20Files%20(x86)/VUE/VUE.jar!/tufts/vue/resources/lw_mapping_1_1.xml -->
<!-- Do Not Remove: Saved date Tue Mar 08 16:39:21 PST 2016 by Jon and Soph on platform Windows 7 6.1 in JVM 1.7.0_21-b11 -->
<!-- Do Not Remove: Saving version @(#)VUE: built May 23 2013 at 2146 by tomadm on Linux 2.6.18-348.2.1.el5 i386 JVM 1.7.0_21-b11(bits=32) -->
<?xml version="1.0" encoding="US-ASCII"?>
<LW-MAP xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="none" ID="0"
    label="Precision_Recall_Query_Workflow_Diagram.vue"
    created="1444151180555" x="0.0" y="0.0" width="1.4E-45"
    height="1.4E-45" strokeWidth="0.0" autoSized="false">
    <resource referenceCreated="1457483961731" size="28611"
        spec="C:\Users\Jon and Soph\Desktop\SS Doc\UIUC\UCSB\PrecisionRecallCode\Precision_Recall_Query_Workflow_Diagram.vue"
        type="1" xsi:type="URLResource">
        <title>Precision_Recall_Query_Workflow_Diagram.vue</title>
        <property key="File" value="C:\Users\Jon and Soph\Desktop\SS Doc\UIUC\UCSB\PrecisionRecallCode\Precision_Recall_Query_Workflow_Diagram.vue"/>
    </resource>
    <fillColor>#FFFFFF</fillColor>
    <strokeColor>#404040</strokeColor>
    <textColor>#000000</textColor>
    <font>SansSerif-plain-14</font>
    <URIString>http://vue.tufts.edu/rdf/resource/3e34470ec0a8010201bfefb946e153cb</URIString>
    <child ID="6" label="Query" layerID="1" created="1444151250855"
        x="974.0" y="198.0" width="104.20001" height="44.0"
        strokeWidth="1.0" autoSized="false" xsi:type="node">
        <notes>The tasks of submitting the query fragments from the query fragment file and aggregating the query results for all query fragments are accomplished through the "Query_Function.R" script. %sp;The file path for script is currently set as follows:%nl;%nl;'~/dataone/gitcheckout/semantic-query/src/'%nl;%nl;The output of function is set up to be written to the following directory: '~/dataone/gitcheckout/semantic-query/results/'</notes>
        <resource referenceCreated="0" accessAttempted="1457483094903"
            accessSuccessful="1457483094913"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/src/Query_Function.R"
            type="2" xsi:type="URLResource">
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/src/Query_Function.R"/>
        </resource>
        <fillColor>#F1A83E</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e34470fc0a8010201bfefb9c2344b50</URIString>
        <shape arcwidth="20.0" archeight="20.0" xsi:type="roundRect"/>
    </child>
    <child ID="7" label="Filter/Merge" layerID="1"
        created="1444151264258" x="980.5" y="439.5" width="125.70001"
        height="52.5" strokeWidth="1.0" autoSized="false" xsi:type="node">
        <notes>The task of determining which query results are related to which query fragment is accomplished through the "Filter_Merge_Calculate_Funcation.R" script; and the file path for script is currently set as follows:%nl;%nl;'~/dataone/gitcheckout/semantic-query/src/'%nl;%nl;This same file also contains the codes for the Calculate (Precision/Recall) task.</notes>
        <resource referenceCreated="0" accessAttempted="1457483349885"
            accessSuccessful="1457483349895"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/src/Filter_Merge_Calculate_Function.R"
            type="2" xsi:type="URLResource">
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/src/Filter_Merge_Calculate_Function.R"/>
        </resource>
        <fillColor>#F1A83E</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e34470fc0a8010201bfefb92d957a63</URIString>
        <shape arcwidth="20.0" archeight="20.0" xsi:type="roundRect"/>
    </child>
    <child ID="8" label="Calculate &#xa;(Precision/Recall)" layerID="1"
        created="1444151266888" x="979.5" y="637.0" width="145.70001"
        height="63.5" strokeWidth="1.0" autoSized="false" xsi:type="node">
        <notes>The task of calculating the values of precision and recall for each query fragment is accomplished through the "Filter_Merge_Calculate_Funcation.R" script; and the file path for script is currently set as follows:%nl;%nl;'~/dataone/gitcheckout/semantic-query/src/'%nl;%nl;This same file also contains the codes for the Filter/Merge task.%nl;%nl;The output of function is set up to be written and append to the following file: '~/dataone/gitcheckout/semantic-query/results/Prec_Recall_Results.txt'%nl;</notes>
        <resource referenceCreated="0" accessAttempted="1457483418646"
            accessSuccessful="1457483418655"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/src/Filter_Merge_Calculate_Function.R"
            type="2" xsi:type="URLResource">
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/src/Filter_Merge_Calculate_Function.R"/>
        </resource>
        <fillColor>#F1A83E</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344710c0a8010201bfefb973cfd529</URIString>
        <shape arcwidth="20.0" archeight="20.0" xsi:type="roundRect"/>
    </child>
    <child ID="10" label="CN-Sandbox" layerID="1"
        created="1444151426789" x="1151.0" y="33.0" width="105.0"
        height="59.0" strokeWidth="1.0" autoSized="false" xsi:type="node">
        <fillColor>#83CEFF</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344710c0a8010201bfefb96d2d2715</URIString>
        <shape xsi:type="ellipse"/>
    </child>
    <child ID="11" label="uc52_queries_EML.csv" layerID="1"
        created="1444151477045" x="766.0" y="1.0" width="227.0"
        height="96.0" strokeWidth="1.0" autoSized="true" xsi:type="node">
        <notes>Please note that this query fragment file name is only an example. %sp;The file that will be used for the actual query run may be updated/adjusted accordingly.%nl;%nl;The following are the information included in a query fragment file:%nl;%nl;Query_ID%nl;SOLR_Index_Type%nl;Query_Frag%nl;Ontology_Set_ID</notes>
        <resource referenceCreated="0" accessAttempted="1457483182423"
            accessSuccessful="1457483182432"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/lib/queries/uc52_queries_EML.csv"
            type="2" xsi:type="URLResource">
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/lib/queries/uc52_queries_EML.csv"/>
        </resource>
        <fillColor>#DAA9FF</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344711c0a8010201bfefb9aaea9e9c</URIString>
        <shape xsi:type="rhombus"/>
    </child>
    <child ID="12" label="Resultset_Summary_RunID_.csv" layerID="1"
        created="1444151586275" x="1235.0" y="160.0" width="298.0"
        height="112.0" strokeWidth="1.0" autoSized="true" xsi:type="node">
        <notes>Please note that this Resultset_Summary_RunID file name is only an example. %sp;The actual file that is associated with each actual query run will be created accordingly.%nl;%nl;The "RunID" part of the file name uses the information from "Run_ID" shown as follows.%nl;%nl;The following are the information included in a "Resultset_Summary_RunID.csv" file (the information in the parenthesis is the potential source for the data; PK = Primary Key): %sp;%nl;%nl;PK %sp; Dataset_ID (SOLR query results)%nl; %sp; %sp; %sp; %sp;R_Time (R)%nl; %sp; %sp; %sp; %sp;D1_node (config file)%nl;PK %sp; Query_ID (input file)%nl; %sp; %sp; %sp; %sp;SOLR_Index_Type (input file)%nl;PK %sp; Run_ID (Config file)%nl; %sp; %sp; %sp; %sp;Ontology_Set_ID (Config file)%nl; %nl;Note: Run_ID = DateTime + SOLR_Index_Type</notes>
        <resource referenceCreated="0" accessAttempted="1457483225879"
            accessSuccessful="1457483225888"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/results/Resultset_Summary_2015-10-20%2016:12:16_.csv"
            type="2" xsi:type="URLResource">
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/results/Resultset_Summary_2015-10-20%2016:12:16_.csv"/>
        </resource>
        <fillColor>#DAA9FF</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344712c0a8010201bfefb9e7ec3918</URIString>
        <shape xsi:type="rhombus"/>
    </child>
    <child ID="13" label="operates on" layerID="1"
        created="1444151720018" x="1050.3795" y="86.870605"
        width="125.60742" height="111.629456" strokeWidth="1.0"
        autoSized="false" controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344712c0a8010201bfefb9b27968f0</URIString>
        <point1 x="1050.8795" y="198.00006"/>
        <point2 x="1175.4869" y="87.370605"/>
        <ID1 xsi:type="node">6</ID1>
        <ID2 xsi:type="node">10</ID2>
    </child>
    <child ID="15" label="is input for" layerID="1"
        created="1444151832592" x="920.15076" y="96.5" width="87.58832"
        height="102.0" strokeWidth="1.0" autoSized="false"
        controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344713c0a8010201bfefb94ac3d96e</URIString>
        <point1 x="920.6508" y="97.0"/>
        <point2 x="1007.23914" y="198.0"/>
        <ID1 xsi:type="node">11</ID1>
        <ID2 xsi:type="node">6</ID2>
    </child>
    <child ID="16" label="produces" layerID="1" created="1444151895616"
        x="1077.7" y="211.37895" width="186.88684" height="14.0"
        strokeWidth="1.0" autoSized="false" controlCount="0"
        arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344714c0a8010201bfefb96ab69d20</URIString>
        <point1 x="1078.2" y="219.41771"/>
        <point2 x="1264.0868" y="217.3402"/>
        <ID1 xsi:type="node">6</ID1>
        <ID2 xsi:type="node">12</ID2>
    </child>
    <child ID="17" label="is input for" layerID="1"
        created="1444152082567" x="1078.654" y="271.5" width="229.46399"
        height="168.5" strokeWidth="1.0" autoSized="false"
        controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344714c0a8010201bfefb98e854342</URIString>
        <point1 x="1307.6179" y="272.0"/>
        <point2 x="1079.1539" y="439.5"/>
        <ID1 xsi:type="node">12</ID1>
        <ID2 xsi:type="node">7</ID2>
    </child>
    <child ID="18"
        label="test_corpus_e_&#xa;groundtruth_carbon_flux_queries.csv"
        layerID="1" created="1444152135712" x="631.19995" y="538.0"
        width="324.0" height="118.0" strokeWidth="1.0" autoSized="true" xsi:type="node">
        <notes>Please note that this ground truth file name is only an example. %sp;The file that will be used for the actual query run may be updated/adjusted accordingly.%nl;%nl;The following are the information included in a ground truth file: %sp;%nl;%nl;Dataset_ID%nl;q1 (boolean)%nl;q2 (boolean)%nl;q3 (boolean)%nl;q4 (boolean)%nl;.%nl;.%nl;.%nl;q10 (boolean)%nl;formatid%nl;%nl;For q1 to q10:%nl;1 = the dataset ID is a ground truth for the query%nl;0 = the dataset ID is NOT a ground truth for the query</notes>
        <resource referenceCreated="0" accessAttempted="1457483455893"
            accessSuccessful="1457483455902"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/lib/ground_truth/test_corpus_e_groundtruth_carbon_flux_queries.csv"
            type="2" xsi:type="URLResource">
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/lib/ground_truth/test_corpus_e_groundtruth_carbon_flux_queries.csv"/>
        </resource>
        <fillColor>#DAA9FF</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344715c0a8010201bfefb9e5daff1d</URIString>
        <shape xsi:type="rhombus"/>
    </child>
    <child ID="19" label="is input for" layerID="1"
        created="1444152152623" x="905.1484" y="491.5" width="88.67163"
        height="47.0" strokeWidth="1.0" autoSized="false"
        controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344716c0a8010201bfefb94830e126</URIString>
        <point1 x="905.6484" y="538.0"/>
        <point2 x="993.32" y="492.0"/>
        <ID1 xsi:type="node">18</ID1>
        <ID2 xsi:type="node">7</ID2>
    </child>
    <child ID="20" label="filter_merge object" layerID="1"
        created="1444152187634" x="1257.6" y="472.4" width="186.6"
        height="64.600006" strokeWidth="1.0" autoSized="true" xsi:type="node">
        <notes>filter_merge object is currently constructed as a R data frame and is not an output that the user can access or view directly.%nl;%nl;The following are the information included in the "filter_merge" object (the information in the parenthesis is the suggested data type; PK = Primary Key)%nl;%nl;PK %sp; Dataset_ID %nl; %sp; %sp; %sp; %sp;R_Time%nl; %sp; %sp; %sp; %sp;D1_node%nl;PK %sp; Query_ID%nl; %sp; %sp; %sp; %sp;SOLR_Index_Type %nl;PK %sp; Run_ID %nl; %sp; %sp; %sp; %sp;Ontology_Set_ID%nl; %sp; %sp; %sp; %sp;q1%nl; %sp; %sp; %sp; %sp;.%nl; %sp; %sp; %sp; %sp;.%nl; %sp; %sp; %sp; %sp;.%nl; %sp; %sp; %sp; q10%nl; %sp; %sp; %sp; formatid%nl;%nl;</notes>
        <fillColor>#DAA9FF</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344716c0a8010201bfefb9328865b0</URIString>
        <shape xsi:type="rhombus"/>
    </child>
    <child ID="21" label="produces" layerID="1" created="1444152371772"
        x="1105.7" y="473.20972" width="176.1488" height="23.181915"
        strokeWidth="1.0" autoSized="false" controlCount="0"
        arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e344717c0a8010201bfefb96a3d1424</URIString>
        <point1 x="1106.2" y="473.70972"/>
        <point2 x="1281.3488" y="495.89163"/>
        <ID1 xsi:type="node">7</ID1>
        <ID2 xsi:type="node">20</ID2>
    </child>
    <child ID="22" label="is input for" layerID="1"
        created="1444152416293" x="1109.631" y="536.5" width="182.9873"
        height="101.0" strokeWidth="1.0" autoSized="false"
        controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e34471bc0a8010201bfefb9976fe194</URIString>
        <point1 x="1292.1183" y="537.0"/>
        <point2 x="1110.131" y="637.0"/>
        <ID1 xsi:type="node">20</ID1>
        <ID2 xsi:type="node">8</ID2>
    </child>
    <child ID="23" label="Prec_Recall_Results.txt" layerID="1"
        created="1444152441095" x="531.89996" y="735.69995"
        width="231.20001" height="97.200005" strokeWidth="1.0"
        autoSized="true" xsi:type="node">
        <notes>The following are the information included in the "Prec_Recall_Results.txt" file (the information in the parenthesis is the suggested data type; PK = Primary Key)%nl;%nl;PK %sp; Test_Corpus_ID (string)%nl;PK %sp; Query_ID (string)%nl; %sp; %sp; %sp; %sp;SOLR_Index_Type (string)%nl;PK %sp; Run_ID (string)%nl; %sp; %sp; %sp; %sp;Ontology_Set_ID (string)%nl; %sp; %sp; %sp; %sp;Precision %nl; %sp; %sp; %sp; %sp;Recall %nl;%nl;This is the final output for the Wrapper ("Precision_Recall_Wrapper.R").</notes>
        <resource referenceCreated="0" accessAttempted="1457483543428"
            accessSuccessful="1457483543437"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/results/Prec_Recall_Results.txt"
            type="2" xsi:type="URLResource">
            <property key="Content.type" value="text/plain"/>
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/results/Prec_Recall_Results.txt"/>
        </resource>
        <fillColor>#DAA9FF</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e34471bc0a8010201bfefb9b7302720</URIString>
        <shape xsi:type="rhombus"/>
    </child>
    <child ID="24" label="appends results to" layerID="1"
        created="1444152513443" x="754.0095" y="689.04236"
        width="225.99054" height="65.215515" strokeWidth="1.0"
        autoSized="false" controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/3e34471cc0a8010201bfefb9cfcb13f8</URIString>
        <point1 x="979.5" y="689.54236"/>
        <point2 x="754.50946" y="753.7579"/>
        <ID1 xsi:type="node">8</ID1>
        <ID2 xsi:type="node">23</ID2>
    </child>
    <child ID="26" label="Wrapper" layerID="1" created="1445017577856"
        x="320.43848" y="185.84998" width="212.0" height="139.0"
        strokeWidth="1.0" autoSized="false" xsi:type="node">
        <notes>By providing the file locations for the query fragment file and the ground truth file, the Wrapper is the only function that the user needs to run to calculate the recall and precision values for each of the query fragments in the query fragment file.%nl;%nl;Please note that the Wrapper assumes that the other two scripts required by the Wrapper (i.e. Query_Function.R and Filter_Merge_Calculate_Function.R) are located in the following directory. %sp;If this is NOT the case, please adjust the directory structure accordingly.%nl;%nl;~/dataone/gitcheckout/semantic-query/src/%nl;%nl;The following are the two lines that should be entered in the R environment in order for the final output, the "Prec_Recall_Results.txt" file, to be generated using the files and functions indicated in this diagram. %sp;%nl;%nl;&gt;source('~/dataone/gitcheckout/semantic-query/src/Precision_Recall_Wrapper.R')%nl;&gt;precicison_recall_wrapper('~/dataone/gitcheckout/semantic-query/lib/queries/uc52_queries_EML.csv', '~/dataone/gitcheckout/semantic-query/lib/ground_truth/test_corpus_e_groundtruth_carbon_flux_queries.csv')%nl;%nl;As examples, the second line uses 'uc52_queries_EML.csv' and 'test_corpus_e_groundtruth_carbon_flux_queries.csv' as the query fragment file and the ground truth file names respectively. %sp;The exact file name for the query fragment file and the ground truth file can be modified accordingly for each query run.%nl;%nl;</notes>
        <resource referenceCreated="0" accessAttempted="1457482844690"
            accessSuccessful="1457482844700"
            spec="https://github.com/DataONEorg/semantic-query/blob/master/src/Precision_Recall_Wrapper.R"
            type="2" xsi:type="URLResource">
            <property key="URL" value="https://github.com/DataONEorg/semantic-query/blob/master/src/Precision_Recall_Wrapper.R"/>
        </resource>
        <fillColor>#FEFEC9</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/71cc7803c0a8010201077f708f6bb17c</URIString>
        <shape xsi:type="diamond"/>
    </child>
    <child ID="27" label="User" layerID="1" created="1445017633239"
        x="265.59998" y="-39.150024" width="167.0" height="100.0"
        strokeWidth="1.0" autoSized="false" xsi:type="node">
        <fillColor>#C1F780</fillColor>
        <strokeColor>#000000</strokeColor>
        <textColor>#000000</textColor>
        <font>Arial-plain-12</font>
        <URIString>http://vue.tufts.edu/rdf/resource/71cc7803c0a8010201077f7018f6d457</URIString>
        <shape xsi:type="diamond"/>
    </child>
    <child ID="28"
        label="provides query fragement file and ground truth file location information to"
        layerID="1" created="1445017656678" x="210.31396" y="52.387573"
        width="350.0" height="145.90039" strokeWidth="1.0"
        autoSized="false" controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/71cc7804c0a8010201077f70f09fe621</URIString>
        <point1 x="362.39703" y="52.887573"/>
        <point2 x="408.2309" y="197.78796"/>
        <ID1 xsi:type="node">27</ID1>
        <ID2 xsi:type="node">26</ID2>
    </child>
    <child ID="30"
        label="returns the file location of Resultset_Summary_RunID_.csv to"
        layerID="1" created="1445017788565" x="507.29254" y="240.66891"
        width="473.24792" height="58.42563" strokeWidth="1.0"
        autoSized="false" controlCount="1" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/71cc7804c0a8010201077f7074fd9c1b</URIString>
        <point1 x="980.04047" y="241.16891"/>
        <point2 x="507.79254" y="271.50934"/>
        <ID1 xsi:type="node">6</ID1>
        <ID2 xsi:type="node">26</ID2>
        <ctrlPoint0 x="791.43854" y="327.84998" xsi:type="point"/>
    </child>
    <child ID="29"
        label="passes query fragment file location information to"
        layerID="1" created="1445017724541" x="523.19434" y="222.57127"
        width="451.30573" height="27.545471" strokeWidth="1.0"
        autoSized="false" controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/71cc7804c0a8010201077f706ff04f74</URIString>
        <point1 x="523.6943" y="249.61674"/>
        <point2 x="974.0" y="223.07127"/>
        <ID1 xsi:type="node">26</ID1>
        <ID2 xsi:type="node">6</ID2>
    </child>
    <child ID="32"
        label="passes ground truth and Resultset_Summary_RunID_,csv file location information to"
        layerID="1" created="1445017864908" x="495.66754" y="278.63135"
        width="486.68002" height="166.643" strokeWidth="1.0"
        autoSized="false" controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/71cc7805c0a8010201077f70c845c5fb</URIString>
        <point1 x="496.16757" y="279.13135"/>
        <point2 x="981.8476" y="444.77435"/>
        <ID1 xsi:type="node">26</ID1>
        <ID2 xsi:type="node">7</ID2>
    </child>
    <child ID="36" label="is the final output for" layerID="1"
        created="1445019056611" x="448.73706" y="309.40186"
        width="178.95175" height="426.7981" strokeWidth="1.0"
        autoSized="false" controlCount="0" arrowState="2" xsi:type="link">
        <strokeColor>#404040</strokeColor>
        <textColor>#404040</textColor>
        <font>Arial-plain-11</font>
        <URIString>http://vue.tufts.edu/rdf/resource/71d9352bc0a8010201077f70fece4269</URIString>
        <point1 x="627.18884" y="735.69995"/>
        <point2 x="449.2371" y="309.90186"/>
        <ID1 xsi:type="node">23</ID1>
        <ID2 xsi:type="node">26</ID2>
    </child>
    <layer ID="1" label="Layer 1" created="1444151180559" x="0.0"
        y="0.0" width="1.4E-45" height="1.4E-45" strokeWidth="0.0" autoSized="false">
        <URIString>http://vue.tufts.edu/rdf/resource/3e34471cc0a8010201bfefb9573c30ae</URIString>
    </layer>
    <userZoom>1.0</userZoom>
    <userOrigin x="-214.18855" y="-186.65002"/>
    <presentationBackground>#202020</presentationBackground>
    <PathwayList currentPathway="0" revealerIndex="-1">
        <pathway ID="0" label="Untitled Pathway" created="1444151180555"
            x="0.0" y="0.0" width="1.4E-45" height="1.4E-45"
            strokeWidth="0.0" autoSized="false" currentIndex="0" open="true">
            <strokeColor>#B3993333</strokeColor>
            <textColor>#000000</textColor>
            <font>SansSerif-plain-14</font>
            <URIString>http://vue.tufts.edu/rdf/resource/3e34471dc0a8010201bfefb9406c70fd</URIString>
            <masterSlide ID="2" created="1444151180618" x="0.0" y="0.0"
                width="800.0" height="600.0" locked="true"
                strokeWidth="0.0" autoSized="false">
                <fillColor>#000000</fillColor>
                <strokeColor>#404040</strokeColor>
                <textColor>#000000</textColor>
                <font>SansSerif-plain-14</font>
                <URIString>http://vue.tufts.edu/rdf/resource/3e34471dc0a8010201bfefb9bc8dc24f</URIString>
                <titleStyle ID="3" label="Header"
                    created="1444151182793" x="335.5" y="172.5"
                    width="129.0" height="55.0" strokeWidth="0.0"
                    autoSized="true" isStyle="true" xsi:type="node">
                    <strokeColor>#404040</strokeColor>
                    <textColor>#FFFFFF</textColor>
                    <font>Gill Sans-plain-36</font>
                    <URIString>http://vue.tufts.edu/rdf/resource/3e34471dc0a8010201bfefb9ba9edb60</URIString>
                    <shape xsi:type="rectangle"/>
                </titleStyle>
                <textStyle ID="4" label="Slide Text"
                    created="1444151182794" x="346.5" y="281.5"
                    width="107.0" height="37.0" strokeWidth="0.0"
                    autoSized="true" isStyle="true" xsi:type="node">
                    <strokeColor>#404040</strokeColor>
                    <textColor>#FFFFFF</textColor>
                    <font>Gill Sans-plain-22</font>
                    <URIString>http://vue.tufts.edu/rdf/resource/3e34471dc0a8010201bfefb9c4354f11</URIString>
                    <shape xsi:type="rectangle"/>
                </textStyle>
                <linkStyle ID="5" label="Links" created="1444151182795"
                    x="373.5" y="384.0" width="53.0" height="32.0"
                    strokeWidth="0.0" autoSized="true" isStyle="true" xsi:type="node">
                    <strokeColor>#404040</strokeColor>
                    <textColor>#B3BFE3</textColor>
                    <font>Gill Sans-plain-18</font>
                    <URIString>http://vue.tufts.edu/rdf/resource/3e34471ec0a8010201bfefb9cc681df7</URIString>
                    <shape xsi:type="rectangle"/>
                </linkStyle>
            </masterSlide>
        </pathway>
    </PathwayList>
    <date>2015-10-06</date>
    <modelVersion>6</modelVersion>
    <saveLocation>C:\Users\Jon and Soph\Desktop\SS Doc\UIUC\UCSB\PrecisionRecallCode</saveLocation>
    <saveFile>C:\Users\Jon and Soph\Desktop\SS Doc\UIUC\UCSB\PrecisionRecallCode\Precision_Recall_Query_Workflow_Diagram.vue</saveFile>
</LW-MAP>
