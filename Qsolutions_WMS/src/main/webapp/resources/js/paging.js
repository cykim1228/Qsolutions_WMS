/**
 * Paging JavaScript
 */


//submit
function frmPaging() {
    document.getElementById("frmPaging").submit();
}
// 이전 페이지 index
function pagePre(index, pageCnt) {
    if (0 < index - pageCnt) {
        index -= pageCnt;
        document.getElementById("pageStartNum").value = index;
        document.getElementById("index").value = index - 1;
        frmPaging();
    }		
}
// 다음 페이지 index
function pageNext(index, total, listCnt, pageCnt) {
    var totalPageCnt = Math.ceil(total / listCnt);
    var max = Math.ceil(totalPageCnt / pageCnt);

    if (max * pageCnt > index + pageCnt) {
            index += pageCnt;
            document.getElementById("pageStartNum").value = index;
            document.getElementById("index").value = index - 1;
            frmPaging();
    }

}
// 마지막 페이지 index
function pageLast(index, total, listCnt, pageCnt) {

    var totalPageCnt = Math.ceil(total / listCnt);
    var max = Math.ceil(totalPageCnt / pageCnt);
    while (max * pageCnt > index + pageCnt) {
        index += pageCnt;
    }
    var remainListCnt = total - listCnt * (index - 1);
    var remainPageCnt = Math.floor(remainListCnt / listCnt);
    if (remainListCnt % listCnt != 0) {
        remainPageCnt++;
    }
    var pageLastNum = 0;
    if (remainListCnt <= listCnt) {
        pageLastNum = index;
    } else if (remainPageCnt <= pageCnt) {
        pageLastNum = remainPageCnt + index - 1;
    } else {
        pageLastNum = pageCnt + index - 1;
    }
    document.getElementById("pageStartNum").value = index;
    document.getElementById("index").value = pageLastNum - 1;
    frmPaging();
}
// index 리스트 처리
function pageIndex(pageStartNum) {
    
    document.getElementById("index").value = pageStartNum - 1;
    frmPaging();
}
// 리스트출력개수 처리
function listCnt() {
    document.getElementById("index").value = 0;
    document.getElementById("pageStartNum").value = 1;
    document.getElementById("listCnt").value = document.getElementById("listCount").value;
    frmPaging();
}
window.onload = function() {
    // 현재번호 active
    var index = document.getElementById("index").value;
    var pageIndex = document.querySelector('.pageIndex'+(Number(index)+1));
    pageIndex.setAttribute("class", "active");
    // 리스트갯수 selected 처리
    $("#listCount > option").each(function () {
        if ($(this).val() == $('#listCnt').val()) {
            $(this).prop("selected", true);
        }
    });
}

// ----------------------------------------------- //

/*//submit
function frmPagingCowork() {
    document.getElementById("frmPagingCowork").submit();
}
// 이전 페이지 index
function pagePreCowork(indexCowork, pageCntCowork) {
    if (0 < indexCowork - pageCntCowork) {
        indexCowork -= pageCntCowork;
        document.getElementById("pageStartNumCowork").value = indexCowork;
        document.getElementById("indexCowork").value = indexCowork - 1;
        frmPagingCowork();
    }		
}
// 다음 페이지 index
function pageNextCowork(indexCowork, totalCowork, listCntCowork, pageCntCowork) {
    var totalPageCntCowork = Math.ceil(totalCowork / listCntCowork);
    var maxCowork = Math.ceil(totalPageCntCowork / pageCntCowork);

    if (maxCowork * pageCntCowork > indexCowork + pageCntCowork) {
            indexCowork += pageCntCowork;
            document.getElementById("pageStartNumCowork").value = indexCowork;
            document.getElementById("indexCowork").value = indexCowork - 1;
            frmPagingCowork();
    }

}
// 마지막 페이지 index
function pageLastCowork(indexCowork, totalCowork, listCntCowork, pageCntCowork) {

    var totalPageCntCowork = Math.ceil(totalCowork / listCntCowork);
    var maxCowork = Math.ceil(totalPageCntCowork / pageCntCowork);
    while (maxCowork * pageCntCowork > indexCowork + pageCntCowork) {
        indexCowork += pageCntCowork;
    }
    var remainListCntCowork = totalCowork - listCntCowork * (indexCowork - 1);
    var remainPageCntCowork = Math.floor(remainListCntCowork / listCntCowork);
    if (remainListCntCowork % listCntCowork != 0) {
        remainPageCntCowork++;
    }
    var pageLastNumCowork = 0;
    if (remainListCntCowork <= listCntCowork) {
        pageLastNumCowork = indexCowork;
    } else if (remainPageCntCowork <= pageCntCowork) {
        pageLastNumCowork = remainPageCntCowork + indexCowork - 1;
    } else {
        pageLastNumCowork = pageCntCowork + indexCowork - 1;
    }
    document.getElementById("pageStartNumCowork").value = indexCowork;
    document.getElementById("indexCowork").value = pageLastNumCowork - 1;
    frmPagingCowork();
}
// index 리스트 처리
function pageIndexCowork(pageStartNumCowork) {
    
    document.getElementById("indexCowork").value = pageStartNumCowork - 1;
    frmPagingCowork();
}
// 리스트출력개수 처리
function listCntCowork() {
    document.getElementById("indexCowork").value = 0;
    document.getElementById("pageStartNumCowork").value = 1;
    document.getElementById("listCntCowork").value = 5;
    // document.getElementById("listCnt").value = document.getElementById("listCount").value;
    frmPagingCowork();
}*/
//window.onload = function() {
//    // 현재번호 active
//    var indexCowork = document.getElementById("indexCowork").value;
//    var pageIndexCowork = document.querySelector('.pageIndexCowork'+(Number(indexCowork)+1));
//    pageIndexCowork.setAttribute("class", "active");
//    // 리스트갯수 selected 처리
//    $("#listCount > option").each(function () {
//        if ($(this).val() == $('#listCntCowork').val()) {
//            $(this).prop("selected", true);
//        }
//    });
//}
