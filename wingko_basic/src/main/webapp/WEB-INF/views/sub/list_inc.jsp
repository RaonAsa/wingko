<%--
  - 작성자   ysh
  - 작성일자 2013. 8. 28.
  - 내용
  -
  -
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


            <c:choose>
            	<c:when test="${fn:length(list) > 0 }">
            		<c:forEach var="data" items="${list}" varStatus="status">
            			<c:if test="${status.index % 2 == 0 }">
            				<c:if test="${status.index > 0 }">
								<tr>
					            	<td colspan="4" class="space"></td><!--여백-->
					            </tr>
            				</c:if>
            				<tr>
            				<c:set value="0" var="i" />
            			</c:if>

		            	<th onclick="javascript:view('${data.store_no}');" class="hand"><img src="http://www.wingkostory.com/upload/${data.image_thumb}" alt="" /></th>
		                <td>
		                	<div onclick="javascript:view('${data.store_no}');" class="hand">
								<span>${data.title}</span><br/>${data.content}
		                	</div>
		                </td>
		                
						<c:if test="${status.index % 2 == 1 }"></tr></c:if>
						<c:set value="${i+1}" var="i" />
            		</c:forEach>
            		<c:forEach var="j" begin="1" end="2" step="1">
            			<c:if test="${i < j }"><th></th><td></td><c:set value="${i+1}" var="i" /></c:if>
            			<c:if test="${i == 2 }">
            				</tr>
							<tr>
				            	<td colspan="4" class="space"></td><!--여백-->
				            </tr>
            			</c:if>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
					<tr>
		            	<td colspan="4" class="space">데이터가 없습니다.</td>
		            </tr>
					<tr>
		            	<td colspan="4" class="space"></td><!--여백-->
		            </tr>
            	</c:otherwise>
            </c:choose>