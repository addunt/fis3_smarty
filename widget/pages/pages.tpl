<nav aria-label="Page navigation" style="float: right;">
  <span class='pager-summary'>共 <em><{$total}></em> 条记录, 每页 <em><{$page_size}></em> 条, 共 <em><{$page_total}></em> 页</span>
  <ul class="pagination">
    <li class="<{if $page == 1}>disabled<{/if}>">
      <a href="<{if $page == 1}>#<{else}><{$url}><{$page - 1}><{/if}>" aria-label="Previous">
        <span aria-hidden="true">«</span>
      </a>
    </li>
    <li class="<{if $page == 1}>active<{/if}>">
      <a href="<{if $page == 1}>#<{else}><{$url}>1<{/if}>">1</a>
    </li>
    <{if $page_total >= 2}>
    <li class="<{if $page == 2}>active<{/if}>">
      <a href="<{if $page == 2}>#<{else}><{$url}>2<{/if}>">2</a>
    </li>
    <{/if}>
    <{if $page_total >= 3}>
    <li class="<{if $page == 3}>active<{/if}>">
      <a href="<{if $page == 3}>#<{else}><{$url}>3<{/if}>">3</a>
    </li>
    <{/if}>
    <{if $page_total - 2 > 4}>
    <li>
      <a href="#">...</a>
    </li>
    <{/if}>
    <{if $page_total - 2 > 3}>
    <li class="<{if $page == $page_total - 2}>active<{/if}>">
      <a href="<{if $page == $page_total - 2}>#<{else}><{$url}><{$page_total - 2}><{/if}>"><{$page_total - 2}></a>
    </li>
    <{/if}>
    <{if $page_total - 1 > 3}>
    <li class="<{if $page == $page_total - 1}>active<{/if}>">
      <a href="<{if $page == $page_total - 1}>#<{else}><{$url}><{$page_total - 1}><{/if}>"><{$page_total - 1}></a>
    </li>
    <{/if}>
    <{if $page_total > 3}>
    <li class="<{if $page == $page_total}>active<{/if}>">
      <a href="<{if $page == $page_total}>#<{else}><{$url}><{$page_total}><{/if}>"><{$page_total}></a>
    </li>
    <{/if}>
    <li class="<{if $page == $page_total}>disabled<{/if}>">
      <a href="<{if $page == $page_total}>#<{else}><{$url}><{$page + 1}><{/if}>" aria-label="Next">
        <span aria-hidden="true">»</span>
      </a>
    </li>
  </ul>
</nav>