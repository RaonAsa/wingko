/*
 * @(#)PagedList.java 2013. 8. 3.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.util;

import java.util.Collection;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 3.
 */
public class PagedList<E> implements Collection<E> {
	
	private static Logger logger = LoggerFactory.getLogger(PagedList.class);
	
	private Collection<E> source;
	
	private int page;
	private int pageSize;
	private int skip;
	private int totalCount;
	private int totalPage;
	private int totalBlock;
	private int blockSize;
	private int currentBlock;
	private int startPageNum;
	private int endPageNum;
	
	

	public PagedList(Collection<E> source, int page, int pageSize, int totalCount) {

		this.source = source;
		this.page = page;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		
		this.blockSize = 10;
		this.totalPage = (int)Math.ceil( (double) totalCount / pageSize );
		this.totalBlock = (int)Math.ceil( (double) totalPage / blockSize );
		this.currentBlock = (int)Math.ceil( (double) ((page - 1) / blockSize) ) + 1;
		
		this.startPageNum = ((currentBlock - 1) * blockSize) + 1;
		this.endPageNum = startPageNum + blockSize;
	}
	
	public PagedList(Collection<E> source, int page, int pageSize, int totalCount, int blockSize) {

		this.source = source;
		this.page = page;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		
		this.blockSize = blockSize;
		this.totalPage = (int)Math.ceil( (double) totalCount / pageSize );
		this.totalBlock = (int)Math.ceil( (double) totalPage / blockSize );
		this.currentBlock = (int)Math.ceil( (double) ((page - 1) / blockSize) ) + 1;
		
		this.startPageNum = ((currentBlock - 1) * blockSize) + 1;
		this.endPageNum = startPageNum + blockSize;
	}

	public Collection<E> getSource() {
		return source;
	}
	public void setSource(Collection<E> source) {
		this.source = source;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getSkip() {
		return skip;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getCurrentBlock() {
		return currentBlock;
	}
	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	

	@Override
	public boolean add(E e) {
		// TODO Auto-generated method stub
		return source.add(e);
	}

	@Override
	public boolean addAll(Collection<? extends E> c) {
		// TODO Auto-generated method stub
		return source.addAll(c);
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		source.clear();
	}

	@Override
	public boolean contains(Object o) {
		// TODO Auto-generated method stub
		return source.contains(o);
	}

	@Override
	public boolean containsAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return source.containsAll(c);
	}

	@Override
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return source.isEmpty();
	}

	@Override
	public Iterator<E> iterator() {
		// TODO Auto-generated method stub
		return source.iterator();
	}

	@Override
	public boolean remove(Object o) {
		// TODO Auto-generated method stub
		return source.remove(o);
	}

	@Override
	public boolean removeAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return source.removeAll(c);
	}

	@Override
	public boolean retainAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return source.retainAll(c);
	}

	@Override
	public int size() {
		// TODO Auto-generated method stub
		return source.size();
	}

	@Override
	public Object[] toArray() {
		// TODO Auto-generated method stub
		return source.toArray();
	}

	@Override
	public <T> T[] toArray(T[] a) {
		// TODO Auto-generated method stub
		return source.toArray(a);
	}

}
