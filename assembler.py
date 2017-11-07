
instruction=['load','store','add','sub','mul','sll','srl','and','or','slt','xor','invert']
a={}
for i in range(len(instruction)):
	a[instruction[i]]=format(i, '04b')
f=open('instruction.txt','r').read().split('\n')
mem=['0'*16]*8
kal={}
test=[]
count=0
for i in f:
	
	kw=(i.split(' '))
	#print kw
	if '=' in i:
		
		kal[kw[0]]=count%8
		mem[count%8]=format(int(kw[2]), '016b')
		count=count+1
		#print mem
	else:
		st=''
		if 'invert' in i:
			st=st+a['invert']+kal[kw[1]]+'0'*9
		elif ('load' in i) or ('store' in i):
			st=st+a[kw[0]]+(format(kal[kw[1]],'03b'))*2+'0'*6
		else:
			kal[kw[3]]=count%8
			st=st+a[kw[0]]+format(kal[kw[1]],'03b')+format(kal[kw[2]],'03b')+format(kal[kw[3]],'03b')+'0'*3
			count=count+1
		test.append(st)
thefile = open('test.data', 'w')
for item in test:
	sd=item[:4]+'_'+item[4:8]+'_'+item[8:12]+'_'+item[12:16]
 	thefile.write("%s\n" % sd)		
thefile1 = open('test.prog', 'w')
for item in mem:
	sd=item[:4]+'_'+item[4:8]+'_'+item[8:12]+'_'+item[12:16]
 	thefile1.write("%s\n" % sd)
