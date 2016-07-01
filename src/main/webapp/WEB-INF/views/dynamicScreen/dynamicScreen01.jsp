<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dynamic Screen01</title>
<style type="text/css"></style>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/bootstrap/honoka/css/bootstrap.css"
    type="text/css" media="screen, projection">
</head>

<body>
 <h1>Dynamic Screen01</h1>
 <form:form action="${pageContext.request.contextPath}/dynamic/sendValue" method="post" modelAttribute="dynamicScreenItemForm">
   <div class="container">
     <table class="table table-condensed table-striped tables-hover-rows">
       <c:forEach items="${formFieldList}" var="eachFormFieldList">
       
       <%-- 項目の種別によって、表示を場合分けする。--%>
       <c:choose>
          <%-- ラジオボタン --%>
          <c:when test="${eachFormFieldList.inputType == 'radio'}">
          <tr>
            <td>${f:h(eachFormFieldList.formFieldName)}</td>
            <c:forEach  items="${eachFormFieldList.elements}" var="element">
              <td><input type=${eachFormFieldList.inputType} 
              name="dynamicItemMap[${eachFormFieldList.formFieldId}]">${f:h(element)}</td>
            </c:forEach>
          </tr>
          </c:when>
          <%-- ドロップダウン --%>
          <c:when test="${eachFormFieldList.inputType == 'dropdown'}">
          <tr>
            <td>${f:h(eachFormFieldList.formFieldName)}</td>
            <td><select name="dynamicItemMap[${eachFormFieldList.formFieldId}]">
            <c:forEach  items="${eachFormFieldList.keyValueList}" var="keyValue">
              <option value=${f:h(keyValue.dropdownKey)}>${f:h(keyValue.dropdownVal)}</option>
            </c:forEach>
            </td>
          </tr>          
          </c:when>
          <%-- テキスト --%>
          <c:otherwise>
          <tr>
            <td>${f:h(eachFormFieldList.formFieldName)}</td>
            <td><input type=${eachFormFieldList.inputType} 
            name="dynamicItemMap[${eachFormFieldList.formFieldId}]" value="${eachFormFieldList.initialValue}"></td>
          </tr>
          </c:otherwise>
       </c:choose>
       </c:forEach>
     </table>
   <input type="submit" name="dynamicTest" value="送信">
   </div>
 </form:form>
 </body>
</html>