import Paper from '@material-ui/core/Paper';
import React from "react";
import { Link } from "react-router-dom";
import { Button, Modal, Form, Col, Row } from 'react-bootstrap';
import { connect } from "react-redux";
import { seminarListGetRequest,seminarListOneGetRequest } from "../action/seminarAction";

@connect((store) => {
    return {
        seminarReducer: store.seminarReducer,
    }
})
export class AdditionalSeminarInfo extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            newLength: this.props.seminarReducer.seminarAmounts.find(
                                 seminarAmount => seminarAmount.id === this.props.selected_seminar.id
                               ).amount,
        };
    }

    reloadList = async () => {
       await  this.props.dispatch(seminarListOneGetRequest(this.props.selected_seminar.id))
       this.setState({
             newLength: this.props.seminarReducer.seminarAmC
            }, () => {
            });
        }

    render() {
        let selected_seminar = this.props.selected_seminar;
        let accessCode = selected_seminar.accessCode;
        return (
            <Paper style={{ padding: "8px" }}>
                <Row>
                    <Col sm="9">
                        <h5>Additional information</h5>

                        {selected_seminar.status === 'TODO' &&
                            <div>The seminar hasn't started yet</div>
                        }
                        {selected_seminar.status === 'OPEN' &&
                            <div>
                                <Row><Col>The seminar is open</Col></Row>
                                <Row>
                                    <Col>
                                        Number of completed questionnaires: {this.state.newLength}
                                    </Col>
                                </Row>
                            </div>
                        }
                        {selected_seminar.status === 'CLOSED' &&
                            <div>
                                <Row><Col>The seminar is closed</Col></Row>
                                <Row>
                                    <Col>
                                        Number of completed questionnaires:
                </Col>
                                    <Col>
                                        {this.props.seminarReducer.seminarAmounts.find(
                                                                          seminarAmount => seminarAmount.id === this.props.selected_seminar.id
                                                                        ).amount}
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        Link to the results:
                </Col>
                                    <Col>
                                    <Link to={"/resultSeminar/" + accessCode}>{"/resultSeminar/" + accessCode}</Link>
                </Col>
                                </Row>
                            </div>
                        }
                        {selected_seminar.status === 'CANCELLED' &&
                            <div>The seminar has been cancelled</div>
                        }
                    </Col>
                    <Col sm="3">
                    {selected_seminar.status === 'OPEN' &&
                    <Row><Button onClick={() => this.reloadList()} className="vertical-horizontal-center" style={{ "width": "100" }} ><i className="fas fa-sync-alt"></i></Button></Row>
                    }
                    </Col>
                </Row>
            </Paper>
        )
    }
}

