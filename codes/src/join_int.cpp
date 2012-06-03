#include <iostream>
#include <string>
#include <cstdlib>
#include <cstdio>
#include <fstream>
#include <vector>

using namespace std;


int file_exist(const char* file_name)
{
    std::fstream in_stream(file_name, std::ios::in);
    if (!in_stream || !in_stream.good())
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void string_split(const std::string& s, const std::string& delim,std::vector< std::string > &ret)
{
    ret.clear();
    u_int last = 0;
    size_t index=s.find_first_of(delim,last);
    while (index!=std::string::npos)
    {
        ret.push_back(s.substr(last,index-last));
        last=index+delim.length();
        index=s.find_first_of(delim,last);
    }
    //if (index-last>0)
    //{
    ret.push_back(s.substr(last,index-last));
    //}
} 

unsigned long string_to_int(const std::string& str)
{
    unsigned long res = 0;
    u_int len = str.length();
    int tmp=0;
    for (u_int i = 0; i < len; i ++)
    {
        tmp = str[i] - '0';
        if (tmp < 0 || tmp > 9) {
            fprintf(stderr,"%s transfer error [%d,%d]\n", str.c_str(), tmp, i);
            break;
        }
        res = res * 10 + tmp;
    }
    return res;
}

void print_vector(const std::vector< std::string > &ret)
{
    std::vector< std::string >::const_iterator itr;
    for (itr = ret.begin(); itr != ret.end(); itr ++)
    {
        cout << *itr<< endl;
    }
}

void print_line(const std::vector<std::string>& wordid_line, const std::vector<std::string>& dict_line, u_int wordid_col_num, u_int dict_col_num)
{
    //skip the base columns
    u_int len = wordid_line.size();
    bool first = true;
    //print first file cols
    for (u_int i = 0; i < len; i ++)
    {
        if (i == wordid_col_num)
        {
            //    continue;
        }
        if (!first)
        {
            printf("\t");
        }
        first = false;
        printf("%s", wordid_line[i].c_str());
    }

    // print dict cols
    len = dict_line.size();
    for (u_int i = 0; i < len; i++)
    {
        if (i == dict_col_num)
            continue;
        printf("\t");
        printf("%s", dict_line[i].c_str());

    }
    printf("\n");
}

/*
 *@Fun: map keywordid to keyword
 *@param:
 *    dict_file: dict file, format(wordid\tword)
 *    wordid_file: 
 *    wordid_fieldnum:  start from 0
 */
int keywordid_map_keyword(const char* dict_file, const char *wordid_file, int dict_fieldnum, int wordid_fieldnum)
{
    std::fstream dict_file_stream(dict_file, std::ios::in);
    if (!dict_file_stream || !dict_file_stream.good())
    {
        return 1;
    }

    std::fstream wordid_file_stream(wordid_file, std::ios::in);
    if (!wordid_file_stream || !wordid_file_stream.good())
    {
        return 1;
    }

    std::string dict_line;
    std::string worid_line;

    if (dict_file_stream.eof() || wordid_file_stream.eof())
    {
        return 1;
    }

    getline(wordid_file_stream, worid_line);
    getline(dict_file_stream, dict_line);
    std::vector<std::string> fields_wordid_line;
    std::vector<std::string> fields_dict_line;
    unsigned long wordid_wordid;
    unsigned long dict_wordid;

    string_split(worid_line, "\t", fields_wordid_line);
    string_split(dict_line, "\t", fields_dict_line);

    while (true)
    {
        wordid_wordid = atol(fields_wordid_line[wordid_fieldnum].c_str());
        dict_wordid = atol(fields_dict_line[dict_fieldnum].c_str());
        if (wordid_wordid == dict_wordid)
        {
            print_line(fields_wordid_line, fields_dict_line, wordid_fieldnum, dict_fieldnum);
            if (wordid_file_stream.eof())
            {
                break;
            }
            worid_line[0] = '\0';
            getline(wordid_file_stream, worid_line);
            string_split(worid_line, "\t", fields_wordid_line);
        }
        else if (wordid_wordid > dict_wordid)
        {
            if (dict_file_stream.eof())
            {
                break;
            }
            dict_line[0] = '\0';
            getline(dict_file_stream, dict_line);
            string_split(dict_line, "\t", fields_dict_line);
        }
        else
        {
            // in fact this should not happen
            if (worid_line != "")
            {
                //print_line(fields_wordid_line, wordid_fieldnum, wordid_fieldnum, dict_fieldnum);
                fprintf(stderr, "not found in dict!\n");
            }

            if (wordid_file_stream.eof())
            {
                break;
            }
            worid_line[0] = '\0';
            getline(wordid_file_stream, worid_line);
            string_split(worid_line, "\t", fields_wordid_line);
        }
    }

    //while (true) 
    //{
    //	if (worid_line != "")
    //	{
    //		print_line(fields_wordid_line, fields_dict_line, wordid_fieldnum, dict_fieldnum);
    //	}

    //	if (wordid_file_stream.eof())
    //	{
    //		break;
    //	}
    //	getline(wordid_file_stream, worid_line);
    //	string_split(worid_line, "\t", fields_wordid_line);
    //} 

    // close stream
    dict_file_stream.close();
    wordid_file_stream.close();

    return 0;
}

int main(int argc, char** argv)
{
    if (argc != 5)
    {
        printf("usage: keyword_map dict_file wordid_file dict_fieldnum wordid_fieldnum\n");
        return 1;
    }
    int wordid_fieldnum = string_to_int(argv[4]);
    int dict_fieldnum = string_to_int(argv[3]);

    keywordid_map_keyword(argv[1], argv[2], dict_fieldnum, wordid_fieldnum);

    return 0;
}
