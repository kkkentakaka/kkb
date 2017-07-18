<font size="3"><b>{paginate_prev text="前へ"}</b></font>&nbsp;

{if $paginate.total gt $paginate.limit}
	{paginate_first text="最初のページ"}&nbsp;
{/if}
 {if $paginate.total gt $paginate.limit}
 	{paginate_middle page_limit="15" prefix="&nbsp;" suffix="&nbsp;" format="page" }
 {/if}

{if $paginate.total gt $paginate.limit}
	&nbsp;{paginate_last text="最後のページ"}
{/if}
&nbsp;&nbsp;<font size="3"><b>{paginate_next text="次へ"}</b></font>&nbsp;
{if $paginate.total gt $paginate.limit}
<!-- [{$paginate.total}/{$paginate.page_total} ページ] -->
{assign var=page_num value=$smarty.get.next/10}
[{if $smarty.get.next eq '' OR $smarty.get.next eq 1}1{else}{$page_num|ceil}{/if}/{$paginate.page_total} ページ]
{/if}
